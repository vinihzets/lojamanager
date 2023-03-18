import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/register/presentation/bloc/register_bloc.dart';
import 'package:lojamanager/features/register/presentation/widgets/build_column_register_screen_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildColumnRegisterScreenWidgets(bloc: bloc));
  }
}
