import 'package:flutter/material.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc.dart';

class buildColumnRegisterScreenWidgets extends StatelessWidget {
  RegisterBloc bloc;

  buildColumnRegisterScreenWidgets({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 260,
          child: TextField(),
        ),
        SizedBox(
          width: 260,
          child: TextField(),
        ),
        SizedBox(
          width: 260,
          child: TextField(),
        ),
        SizedBox(
          width: 260,
          child: TextField(),
        ),
        SizedBox(
          width: 260,
          child: TextField(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey)),
              onPressed: () {},
              child: Text(
                'Registrar',
              )),
        )
      ],
    ));
  }
}
