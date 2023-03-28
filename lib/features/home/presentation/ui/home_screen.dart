import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => bloc.logOut(context),
              child: const Text(
                'sair',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
