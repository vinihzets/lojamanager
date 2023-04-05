import 'package:flutter/material.dart';
import '../../domain/entities/categories_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class EditCategoryDialog extends StatefulWidget {
  final CategoriesEntity categories;
  final HomeBloc bloc;

  const EditCategoryDialog(
      {required this.categories, required this.bloc, super.key});

  @override
  State<EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<EditCategoryDialog> {
  @override
  Widget build(BuildContext context) {
    // final urlController = TextEditingController();
    final categoryController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dialog(
          child: GestureDetector(
            child: Card(
              child: Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(widget.categories.icon),
                  ),
                  title: TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(hintText: 'Categoria'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Descartar')),
                    const SizedBox(
                      width: 6,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.redAccent)),
                        onPressed: () {
                          widget.bloc.event.add(HomeEventRemoveCategory(
                              context, widget.categories.id));
                        },
                        child: const Text('Remover')),
                    const SizedBox(
                      width: 6,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          widget.bloc.event.add(HomeEventChangeCategories(
                              context,
                              categoryController.text,
                              widget.categories.id));
                        },
                        child: const Text('Concluir')),
                  ],
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
