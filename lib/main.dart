import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lojamanager/core/injector/inject.dart';
import 'package:lojamanager/features/home/presentation/ui/home_screen.dart';
import 'package:lojamanager/features/initialize/presentation/ui/initialize_screen.dart';
import 'package:lojamanager/features/login/presentation/ui/login_screen.dart';

import 'core/utils/consts.dart';

final gConsts = Consts();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();

  Inject.initialize();

  runApp(MaterialApp(initialRoute: gConsts.initialScreen, routes: {
    gConsts.initialScreen: (_) => const InitializeScreen(),
    gConsts.loginScreen: (_) => const LoginScreen(),
    gConsts.homeScreen: (_) => const HomeScreen(),
  }));
}
