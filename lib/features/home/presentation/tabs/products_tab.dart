import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../core/archiceture/bloc_builder.dart';
import '../../../../core/archiceture/bloc_state.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/products_categories_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../widgets/edit_category_dialog.dart';
import '../../../../main.dart';

class ProductsTab extends StatefulWidget {
  final HomeBloc bloc;
  const ProductsTab({required this.bloc, super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    widget.bloc.event.add(HomeEventGetCategories(context));

    return BlocScreenBuilder(
        stream: widget.bloc.stateCategories,
        builder: (state) {
          if (state is BlocStableState) {
            List<CategoriesEntity> list = state.data;

            return ListView(
                shrinkWrap: true,
                children: list
                    .map((e) => GestureDetector(
                          child: Card(
                            child: ExpansionTile(
                              trailing: TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            EditCategoryDialog(
                                              categories: e,
                                              bloc: widget.bloc,
                                            ));
                                  },
                                  child: const Text(
                                    'Modificar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              onExpansionChanged: (value) {
                                if (value = true) {
                                  widget.bloc.event.add(
                                      HomeEventGetCategoriesProducts(
                                          context, e.id));
                                } else {
                                  null;
                                }
                              },
                              leading: Image.network(e.icon),
                              title: Text(e.name),
                              children: [
                                BlocScreenBuilder(
                                    stream: widget.bloc.stateProducts,
                                    builder: (state) {
                                      if (state is BlocStableState) {
                                        List<ProductsCategoriesEntity>
                                            listProducts = state.data;
                                        return _buildProducts(context,
                                            listProducts, widget.bloc, e);
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    })
                              ],
                            ),
                          ),
                        ))
                    .toList());
          } else if (state is BlocEmptyState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shop,
                  size: 80.0,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Suas Categorias ainda estao vazias',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

_buildProducts(
    BuildContext context,
    List<ProductsCategoriesEntity> listProducts,
    HomeBloc bloc,
    CategoriesEntity e) {
  return Column(
    children: listProducts
        .map((e) => ListTile(
              onTap: () {
                bloc.event.add(HomeEventNavigateToProducts(
                    context, gConsts.productScreen, e));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(e.images.first),
              ),
              title: Text(e.name),
              trailing: Text('R\$ ${e.price}'),
            ))
        .toList()
      ..add(ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.add,
            color: Colors.red,
          ),
        ),
        title: const Text('Adicionar'),
        onTap: () {
          bloc.event.add(HomeEventNavigateCreateNewProduct(
              context, gConsts.newProductScreen, e));
        },
      )),
  );
}
