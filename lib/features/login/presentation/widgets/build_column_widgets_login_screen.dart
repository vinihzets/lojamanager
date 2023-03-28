import 'package:flutter/material.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_bloc.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_event.dart';

class buildColumnWidgets extends StatelessWidget {
  final LoginBloc bloc;

  const buildColumnWidgets({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.house_outlined,
          size: 96,
          color: Colors.redAccent,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 260,
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.password_rounded,
              color: Colors.white,
            ),
            const SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 260,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: passwordController,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () => bloc.event.add(LoginEventSignIn(
                    context, emailController.text, passwordController.text)),
                child: const Text('Faca Login'),
              )),
        ),
      ],
    );
  }
}
