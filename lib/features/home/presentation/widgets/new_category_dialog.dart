import 'package:flutter/material.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';

class NewCategoryDialog extends StatelessWidget {
  final HomeBloc bloc;

  const NewCategoryDialog({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    final imagemUrlController = TextEditingController();
    final categoryController = TextEditingController();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            children: [
              const Text('Imagem URL:'),
              SizedBox(
                width: 200,
                child: TextField(
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
                child: TextField(
                  controller: categoryController,
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () => bloc.event.add(HomeEventCreateNewCategory(
                context, imagemUrlController.text, categoryController.text)),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
            child: const Text('Criar'),
          )
        ]),
      ),
    );
  }
}
