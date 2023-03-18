import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/login/presentation/bloc/login_bloc.dart';

import '../widgets/build_column_widgets_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildColumnWidgets(
          bloc: bloc,
        ),
      ),
    );
  }
}
