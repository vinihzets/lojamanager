import 'package:flutter/material.dart';
import '../../../../core/archiceture/bloc_builder.dart';
import '../../../../core/archiceture/bloc_state.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/products_categories_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../widgets/edit_category_dialog.dart';
import '../../../../main.dart';

class ProductsTab extends StatelessWidget {
  final HomeBloc bloc;
  const ProductsTab({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    bloc.event.add(HomeEventGetCategories(context));

    return BlocScreenBuilder(
        stream: bloc.stateCategories,
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
                                              bloc: bloc,
                                            ));
                                  },
                                  child: const Text(
                                    'Modificar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              onExpansionChanged: (value) {
                                if (value = true) {
                                  bloc.event.add(HomeEventGetCategoriesProducts(
                                      context, e.id));
                                } else {
                                  null;
                                }
                              },
                              leading: Image.network(e.icon),
                              title: Text(e.name),
                              children: [
                                BlocScreenBuilder(
                                    stream: bloc.stateProducts,
                                    builder: (state) {
                                      if (state is BlocStableState) {
                                        List<ProductsCategoriesEntity>
                                            listProducts = state.data;

                                        return Column(
                                          children: listProducts
                                              .map((e) => ListTile(
                                                    onTap: () {
                                                      bloc.event.add(
                                                          HomeEventNavigateToProducts(
                                                              context,
                                                              gConsts
                                                                  .productScreen,
                                                              e));
                                                    },
                                                    leading: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              e.images.first),
                                                    ),
                                                    title: Text(e.name),
                                                    trailing:
                                                        Text('R\$ ${e.price}'),
                                                  ))
                                              .toList()
                                            ..add(ListTile(
                                              leading: const CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              title: const Text('Adicionar'),
                                              onTap: () {
                                                bloc.event.add(
                                                    HomeEventNavigateCreateNewProduct(
                                                        context,
                                                        gConsts
                                                            .newProductScreen,
                                                        e));
                                              },
                                            )),
                                        );
                                      } else if (state is BlocEmptyState) {
                                        return Container();
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    })
                              ],
                            ),
                          ),
                        ))
                    .toList());
          } else if (state is BlocEmptyState) {
            return Container();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
