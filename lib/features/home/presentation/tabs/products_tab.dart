import 'package:flutter/material.dart';
import 'package:lojamanager/core/archiceture/bloc_builder.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';
import 'package:lojamanager/features/home/presentation/widgets/edit_category_dialog.dart';
import 'package:lojamanager/features/home/presentation/widgets/new_category_dialog.dart';
import 'package:lojamanager/main.dart';

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
                                      builder: (context) => EditCategoryDialog(
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
                                                        NetworkImage(e.image),
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
                                            onTap: () {},
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
                  .toList()
                ..add(GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey[850])),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => NewCategoryDialog(
                                      bloc: bloc,
                                    ));
                          },
                          child: const Icon(Icons.add))
                    ],
                  ),
                )),
            );
          } else if (state is BlocEmptyState) {
            return Container();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
