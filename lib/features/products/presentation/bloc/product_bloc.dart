import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/archiceture/bloc_state.dart';
import '../../../../core/utils/hud_mixins.dart';
import '../../../../main.dart';
import '../../domain/usecases/product_modify_usecase.dart';
import 'product_event.dart';

class ProductBloc with HudMixins {
  ProductModifyUseCase productModifyUseCase;

  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<ProductEvent> _event;
  Sink<ProductEvent> get event => _event.sink;

  ProductBloc(this.productModifyUseCase) {
    _state = StreamController.broadcast();
    _event = StreamController.broadcast();

    _event.stream.listen(_mapListenEvent);
  }

  dispatchEvent(ProductEvent event) {
    _event.add(event);
  }

  _mapListenEvent(ProductEvent event) {
    if (event is ProductEventChanges) {
      saveChanges(event.context, event.name, event.description, event.price,
          event.idCategories, event.idProduct, event.sizes, event.images);
    } else if (event is ProductEventNavigate) {
      navigateRemoveUntil(event.context, event.routeName);
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
    final request = await productModifyUseCase.productModify(
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
}
