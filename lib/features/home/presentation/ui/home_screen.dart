import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';
import 'package:lojamanager/features/home/presentation/tabs/orders_tab.dart';
import 'package:lojamanager/features/home/presentation/tabs/products_tab.dart';
import 'package:lojamanager/features/home/presentation/tabs/users_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc bloc;

  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    bloc = GetIt.I.get();
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
            _pageController.animateToPage(p,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Clientes',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Pedidos'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Produtos'),
          ]),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: [
            UsersTab(
              bloc: bloc,
            ),
            OrdersTab(
              bloc: bloc,
            ),
            ProductsTab(
              bloc: bloc,
            )
          ],
        ),
      ),
      floatingActionButton: buildFloating(),
    );
  }

  Widget buildFloating() {
    switch (_page) {
      case 0:
        return Container();
      case 1:
        return SpeedDial(
          backgroundColor: Colors.redAccent,
          overlayOpacity: 0.4,
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.redAccent,
                ),
                backgroundColor: Colors.white,
                label: 'Concluidos abaixo',
                onTap: () => bloc.criterySort(SortCritery.READY_LAST)),
            SpeedDialChild(
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.redAccent,
                ),
                backgroundColor: Colors.white,
                label: 'Concluidos acima',
                onTap: () => bloc.criterySort(SortCritery.READY_FIRST))
          ],
          child: const Icon(Icons.sort),
        );
      case 2:
        return FloatingActionButton(onPressed: () {});
    }
    return Container();
  }
}
