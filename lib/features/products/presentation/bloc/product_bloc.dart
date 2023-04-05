import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';

import '../../../../core/archiceture/bloc_state.dart';
import '../../../../core/utils/hud_mixins.dart';
import '../../../../main.dart';
import '../../domain/usecases/product_usecase.dart';
import 'product_event.dart';

class ProductBloc with HudMixins {
  ProductUseCase productUseCase;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<ProductEvent> _event;
  Sink<ProductEvent> get event => _event.sink;

  ProductBloc(this.productUseCase) {
    _state = StreamController.broadcast();
    _event = StreamController.broadcast();

    _event.stream.listen(_mapListenEvent);
  }

  dispatchEvent(ProductEvent event) {
    _event.add(event);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  _mapListenEvent(ProductEvent event) {
    if (event is ProductEventChanges) {
      saveChanges(event.context, event.name, event.description, event.price,
          event.idCategories, event.idProduct, event.sizes, event.images);
    } else if (event is ProductEventNavigate) {
      navigateRemoveUntil(event.context, event.routeName);
    } else if (event is ProductEventRemove) {
      removeProduct(event.context, event.idCategory, event.productId);
    }
  }

  saveChanges(
    BuildContext context,
    String name,
    String description,
    String price,
    String idCategories,
    String idProduct,
    List sizes,
    List images,
  ) async {
    final request = await productUseCase.productModify(
      name,
      description,
      price,
      idCategories,
      idProduct,
      sizes,
      images,
    );
    request.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      r;
      dispatchEvent(ProductEventNavigate(context, gConsts.homeScreen));
    });
  }

  removeProduct(
      BuildContext context, String idCategory, String productId) async {
    final removeRequest =
        await productUseCase.productRemove(idCategory, productId);
    removeRequest.fold((l) {
      showSnack(context, l.message);
    }, (r) {
      navigateRemoveUntil(context, gConsts.homeScreen);
    });
  }
}
