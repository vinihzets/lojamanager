import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/injector/inject.dart';
import 'features/home/presentation/ui/home_screen.dart';
import 'features/home/presentation/ui/new_product_screen.dart';
import 'features/initialize/presentation/ui/initialize_screen.dart';
import 'features/login/presentation/ui/login_screen.dart';
import 'features/products/presentation/ui/product_screen.dart';

import 'core/utils/consts.dart';

final gConsts = Consts();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Inject.initialize();

  runApp(MaterialApp(initialRoute: gConsts.initialScreen, routes: {
    gConsts.initialScreen: (_) => const InitializeScreen(),
    gConsts.loginScreen: (_) => const LoginScreen(),
    gConsts.homeScreen: (_) => const HomeScreen(),
    gConsts.productScreen: (_) => const ProductScreen(),
    gConsts.newProductScreen: (_) => const NewProductScreen(),
  }));
}
