import 'package:flutter/material.dart';
import 'package:lojamanager/features/products/presentation/bloc/product_bloc.dart';
import 'package:lojamanager/features/products/presentation/bloc/product_event.dart';

class ShowDialogWidget extends StatelessWidget {
  final ProductBloc bloc;
  final id;
  final categoryId;

  const ShowDialogWidget(
      {required this.bloc,
      required this.categoryId,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Deseja realmente excluir esse produto para sempre?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancelar ')),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {
                      bloc.event
                          .add(ProductEventRemove(context, categoryId, id));
                    },
                    child: Text('remover ')),
              )
            ],
          )
        ],
      ),
    );
  }
}
