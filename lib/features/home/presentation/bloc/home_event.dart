import 'package:flutter/material.dart';
import 'package:lojamanager/features/home/data/dto/orders_dto.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';

abstract class HomeEvent {}

class HomeEventNavigate implements HomeEvent {
  BuildContext context;
  Object? args;
  String routeName;

  HomeEventNavigate(this.context, this.routeName);
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
