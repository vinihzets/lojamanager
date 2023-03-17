import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/initialize_bloc.dart';

class InitializeScreen extends StatefulWidget {
  const InitializeScreen({super.key});

  @override
  State<InitializeScreen> createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeScreen> {
  late InitializeBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => bloc.onSplashNavigate(context));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
