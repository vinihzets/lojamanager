import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/core/utils/hud_mixins.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/domain/usecases/categories_changes_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/get_categories_products_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/get_orders_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/get_users_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:lojamanager/features/home/domain/usecases/status_orders_usecase.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';
import 'package:lojamanager/main.dart';

enum SortCritery {
  READY_FIRST,
  READY_LAST,
}

class HomeBloc with HudMixins {
  SignOutUseCase signOutUseCase;
  GetUsersUseCase getUsersUseCase;
  GetOrdersUseCase getOrdersUseCase;
  StatusOrderUseCase statusOrderUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  GetCategoriesProductsUseCase getCategoriesProductsUseCase;
  CategoriesChangesUseCase categoriesChangesUseCase;

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

  late SortCritery sortCritery;

  HomeBloc(
      this.signOutUseCase,
      this.getUsersUseCase,
      this.getOrdersUseCase,
      this.statusOrderUseCase,
      this.getCategoriesUseCase,
      this.getCategoriesProductsUseCase,
      this.categoriesChangesUseCase) {
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
    final productsRequest = await getCategoriesUseCase.getCategories();
    productsRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      dispatchCategoriesState(BlocStableState(r));
    });
  }

  getCategoriesProducts(BuildContext context, String id) async {
    final products =
        await getCategoriesProductsUseCase.getCategoriesProducts(id);
    products.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      _cacheProducts = r;

      dispatchProductsState(BlocStableState(_cacheProducts));
    });
  }

  categoriesChanges(BuildContext context, String category, String id) async {
    final changesRequest =
        await categoriesChangesUseCase.categoriesChanges(category, id);
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
}
