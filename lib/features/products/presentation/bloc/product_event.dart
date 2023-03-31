import 'package:flutter/material.dart';

class ProductEvent {}

class ProductEventChanges implements ProductEvent {
  BuildContext context;
  String name;
  String description;
  String price;
  String idCategories;
  String idProduct;

  ProductEventChanges(this.context, this.name, this.description, this.price,
      this.idCategories, this.idProduct);
}

class ProductEventNavigate implements ProductEvent {
  BuildContext context;
  String routeName;

  ProductEventNavigate(this.context, this.routeName);
}
