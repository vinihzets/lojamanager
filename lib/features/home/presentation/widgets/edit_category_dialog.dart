import 'package:flutter/material.dart';
import 'package:lojamanager/features/home/domain/entities/categories_entity.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';

class EditCategoryDialog extends StatefulWidget {
  CategoriesEntity categories;
  HomeBloc bloc;

  EditCategoryDialog({required this.categories, required this.bloc, super.key});

  @override
  State<EditCategoryDialog> createState() => _EditCategoryDialogState();
}

class _EditCategoryDialogState extends State<EditCategoryDialog> {
  @override
  Widget build(BuildContext context) {
    final urlController = TextEditingController();
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
                    decoration: InputDecoration(hintText: 'Categoria'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      widget.bloc.event.add(HomeEventChangeCategories(context,
                          categoryController.text, widget.categories.id));
                    },
                    child: Text('Concluir'))
              ]),
            ),
          ),
        ),
      ],
    );
  }
}