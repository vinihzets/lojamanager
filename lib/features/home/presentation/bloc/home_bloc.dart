import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:lojamanager/features/home/domain/usecases/categories_usecase.dart';
import '../../../../core/archiceture/bloc_state.dart';
import '../../../../core/utils/hud_mixins.dart';
import '../../data/dto/orders_dto.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/orders_entity.dart';
import '../../domain/entities/products_categories_entity.dart';
import '../../domain/usecases/create_new_product_usecase.dart';
import '../../domain/usecases/get_orders_usecase.dart';
import '../../domain/usecases/users_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/status_orders_usecase.dart';
import 'home_event.dart';
import '../../../../main.dart';

enum SortCritery {
  READY_FIRST,
  READY_LAST,
}

class HomeBloc with HudMixins {
  SignOutUseCase signOutUseCase;
  UsersUseCase getUsersUseCase;
  OrdersUseCase getOrdersUseCase;
  StatusOrderUseCase statusOrderUseCase;
  CategoriesUseCase categoriesUseCase;
  CreateNewProductUseCase createNewProductUseCase;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<HomeEvent> _event;
  Sink<HomeEvent> get event => _event.sink;

  late StreamController<BlocState> _stateOrders;
  Stream<BlocState> get stateOrders => _stateOrders.stream;

  late StreamController<BlocState> _stateCategories;
  Stream<BlocState> get stateCategories => _stateCategories.stream;

  late StreamController<BlocState> _stateProducts;
  Stream<BlocState> get stateProducts => _stateProducts.stream;

  List<OrdersEntity> _cache = [];
  List<ProductsCategoriesEntity> _cacheProducts = [];

  late List states = [];
  late List<CategoriesEntity> categoriesList;
  late SortCritery sortCritery;
  late List productsImages;
  late List productsSizes;

  HomeBloc(
      this.signOutUseCase,
      this.getUsersUseCase,
      this.getOrdersUseCase,
      this.statusOrderUseCase,
      this.categoriesUseCase,
      this.createNewProductUseCase) {
    _event = StreamController.broadcast();
    _state = StreamController.broadcast();

    _stateOrders = StreamController.broadcast();

    _stateCategories = StreamController.broadcast();

    _stateProducts = StreamController.broadcast();

    _event.stream.listen(_mapListenEvent);
    states = [
      '',
      'Aguardando Pagamento',
      'Pagamento aprovado',
      'Enviado',
      'Entregue',
    ];
    categoriesList = [];
    productsImages = [];
    productsSizes = [];
  }

  dispatchProductsState(BlocState state) {
    _stateProducts.add(state);
  }

  dispatchCategoriesState(BlocState state) {
    _stateCategories.add(state);
  }

  dispatchOrdersState(BlocState state) {
    _stateOrders.add(state);
  }

  dispatchEvent(HomeEvent event) {
    _event.add(event);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  _mapListenEvent(HomeEvent event) {
    if (event is HomeEventNavigateRemoveUntil) {
      navigateRemoveUntil(event.context, event.routeName);
    } else if (event is HomeEventGetUsers) {
      getUsers(event.context);
    } else if (event is HomeEventGetOrders) {
      getOrders(event.context);
    } else if (event is HomeEventStatusUp) {
      incStatus(event.context, event.ordersDto);
    } else if (event is HomeEventStatusDown) {
      decStatus(event.context, event.ordersDto);
    } else if (event is HomeEventGetCategories) {
      getCategories(event.context);
    } else if (event is HomeEventGetCategoriesProducts) {
      getCategoriesProducts(event.context, event.id);
    } else if (event is HomeEventNavigateToProducts) {
      navigateThenUntilArgs(event.context, event.routeName, event.args);
    } else if (event is HomeEventNavigateThenUntil) {
      navigateThenUntil(event.context, event.routeName);
    } else if (event is HomeEventChangeCategories) {
      categoriesChanges(event.context, event.name, event.id);
    } else if (event is HomeEventCreateNewCategory) {
      createNewCategory(event.context, event.image, event.category);
    } else if (event is HomeEventRemoveCategory) {
      removeCategory(event.context, event.id);
    } else if (event is HomeEventCreateProduct) {
      createProduct(event.context, event.description, event.idCategory,
          event.images, event.name, event.price, event.sizes);
    } else if (event is HomeEventNavigateCreateNewProduct) {
      navigateThenUntilArgs(event.context, event.routeName, event.args);
    }
  }

  logOut(BuildContext context) async {
    final logoutRequest = await signOutUseCase.signOut();

    logoutRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchEvent(HomeEventNavigateRemoveUntil(context, gConsts.loginScreen));
    });
  }

  getUsers(BuildContext context) async {
    final usersRequest = await getUsersUseCase.getUsers();
    usersRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchState(BlocStableState(r));
    });
  }

  getOrders(BuildContext context) async {
    final ordersRequest = await getOrdersUseCase.getOrders();
    ordersRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      _cache = r;

      dispatchOrdersState(BlocStableState(r));
    });
  }

  decStatus(BuildContext context, OrdersDto ordersDto) async {
    final statusRequest = await statusOrderUseCase.statusDown(ordersDto);
    statusRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchOrdersState(BlocStableState(_cache));
    });
  }

  incStatus(BuildContext context, OrdersDto ordersDto) async {
    final statusRequest = await statusOrderUseCase.statusUp(ordersDto);
    statusRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchOrdersState(BlocStableState(_cache));
    });
  }

  criterySort(SortCritery critery) {
    sortCritery = critery;
    _sort();
  }

  getCategories(BuildContext context) async {
    final productsRequest = await categoriesUseCase.getCategories();
    productsRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      categoriesList = r;

      dispatchCategoriesState(BlocStableState(categoriesList));
    });
  }

  getCategoriesProducts(BuildContext context, String id) async {
    final products = await categoriesUseCase.getCategoriesProducts(id);
    products.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      _cacheProducts = r;

      dispatchProductsState(BlocStableState(_cacheProducts));
    });
  }

  categoriesChanges(BuildContext context, String category, String id) async {
    final changesRequest =
        await categoriesUseCase.categoriesChanges(category, id);
    changesRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      navigateRemoveUntil(context, gConsts.homeScreen);
    });
  }

  void _sort() {
    switch (sortCritery) {
      case SortCritery.READY_FIRST:
        _cache.sort((a, b) {
          int sa = a.status;
          int sb = b.status;

          if (sa < sb) {
            return 1;
          } else if (sa > sb) {
            return -1;
          } else {
            return 0;
          }
        });
        break;

      case SortCritery.READY_LAST:
        _cache.sort((a, b) {
          int sa = a.status;
          int sb = b.status;

          if (sa > sb) {
            return 1;
          } else if (sa < sb) {
            return -1;
          } else {
            return 0;
          }
        });
        break;
    }
    dispatchOrdersState(BlocStableState(_cache));
  }

  createNewCategory(BuildContext context, String icon, String category) async {
    final createCategoryRequest =
        await categoriesUseCase.createNewCategory(icon, category);
    createCategoryRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      navigateRemoveUntil(context, gConsts.homeScreen);
    });
  }

  removeCategory(
    BuildContext context,
    String id,
  ) async {
    final removeRequest = await categoriesUseCase.removeCategory(id);

    removeRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      categoriesList.removeWhere((element) => element.id == id);

      dispatchCategoriesState(BlocStableState(categoriesList));
      Navigator.pop(context);
    });
  }

  createProduct(BuildContext context, String description, String categoryID,
      List images, String name, String price, List sizes) async {
    final newProduct = await createNewProductUseCase.createNewProduct(
        description, categoryID, images, name, price, sizes);
    newProduct.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      navigateThenUntil(context, gConsts.homeScreen);
    });
  }
}
