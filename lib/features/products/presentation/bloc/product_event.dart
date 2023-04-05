import 'package:flutter/material.dart';

class ProductEvent {}

class ProductEventChanges implements ProductEvent {
  BuildContext context;
  String name;
  String description;
  String price;
  String idCategories;
  String idProduct;
  List sizes;
  List images;

  ProductEventChanges(this.context, this.name, this.description, this.price,
      this.idCategories, this.idProduct, this.sizes, this.images);
}

class ProductEventNavigate implements ProductEvent {
  BuildContext context;
  String routeName;

  ProductEventNavigate(this.context, this.routeName);
}

class ProductEventRemove implements ProductEvent {
  BuildContext context;
  String idCategory;
  String productId;

  ProductEventRemove(this.context, this.idCategory, this.productId);
}
