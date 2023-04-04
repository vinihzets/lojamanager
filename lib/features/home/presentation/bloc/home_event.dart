import 'package:flutter/material.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import '../../data/dto/orders_dto.dart';
import '../../domain/entities/products_categories_entity.dart';

abstract class HomeEvent {}

class HomeEventNavigateRemoveUntil implements HomeEvent {
  BuildContext context;
  Object? args;
  String routeName;

  HomeEventNavigateRemoveUntil(this.context, this.routeName);
}

class HomeEventGetUsers implements HomeEvent {
  BuildContext context;

  HomeEventGetUsers(this.context);
}

class HomeEventGetOrders implements HomeEvent {
  BuildContext context;

  HomeEventGetOrders(this.context);
}

class HomeEventStatusUp implements HomeEvent {
  BuildContext context;
  OrdersDto ordersDto;

  HomeEventStatusUp(this.context, this.ordersDto);
}

class HomeEventStatusDown implements HomeEvent {
  BuildContext context;
  OrdersDto ordersDto;

  HomeEventStatusDown(this.context, this.ordersDto);
}

class HomeEventGetCategories implements HomeEvent {
  BuildContext context;

  HomeEventGetCategories(this.context);
}

class HomeEventGetCategoriesProducts implements HomeEvent {
  BuildContext context;
  String id;

  HomeEventGetCategoriesProducts(this.context, this.id);
}

class HomeEventNavigateToProducts implements HomeEvent {
  BuildContext context;
  String routeName;
  ProductsCategoriesEntity args;

  HomeEventNavigateToProducts(this.context, this.routeName, this.args);
}

class HomeEventNavigateCreateNewProduct implements HomeEvent {
  BuildContext context;
  String routeName;
  CategoriesEntity args;

  HomeEventNavigateCreateNewProduct(this.context, this.routeName, this.args);
}

class HomeEventNavigateThenUntil implements HomeEvent {
  BuildContext context;
  String routeName;

  HomeEventNavigateThenUntil(this.context, this.routeName);
}

class HomeEventChangeCategories implements HomeEvent {
  BuildContext context;
  // String image;
  String name;
  String id;

  HomeEventChangeCategories(
      this.context,
      //  this.image,
      this.name,
      this.id);
}

class HomeEventCreateNewCategory implements HomeEvent {
  BuildContext context;
  String image;
  String category;

  HomeEventCreateNewCategory(this.context, this.image, this.category);
}

class HomeEventRemoveCategory implements HomeEvent {
  BuildContext context;

  String id;
  HomeEventRemoveCategory(this.context, this.id);
}

class HomeEventCreateProduct implements HomeEvent {
  BuildContext context;
  String description;
  String idCategory;
  List images;
  String name;
  String price;
  List sizes;

  HomeEventCreateProduct(this.context, this.description, this.idCategory,
      this.images, this.name, this.price, this.sizes);
}
