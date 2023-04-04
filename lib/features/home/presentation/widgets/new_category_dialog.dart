import 'dart:developer';

import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class NewCategoryDialog extends StatelessWidget {
  final HomeBloc bloc;

  const NewCategoryDialog({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final imagemUrlController = TextEditingController();
    final categoryController = TextEditingController();

    return Form(
      key: formKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                const Text('Imagem URL:'),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Insira o Url da Imagem';
                      }
                      return null;
                    },
                    controller: imagemUrlController,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Categoria: '),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Insira a Categoria de Produtos';
                      }
                      return null;
                    },
                    controller: categoryController,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final validate = formKey.currentState!.validate();
                if (validate == true) {
                  bloc.event.add(HomeEventCreateNewCategory(context,
                      imagemUrlController.text, categoryController.text));
                }
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
              child: const Text('Criar'),
            )
          ]),
        ),
      ),
    );
  }
}
