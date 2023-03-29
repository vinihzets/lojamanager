import 'package:flutter/material.dart';
import 'package:lojamanager/core/archiceture/bloc_builder.dart';
import 'package:lojamanager/core/archiceture/bloc_state.dart';
import 'package:lojamanager/features/home/domain/entities/orders_entity.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_bloc.dart';
import 'package:lojamanager/features/home/presentation/bloc/home_event.dart';

class OrdersTab extends StatelessWidget {
  HomeBloc bloc;

  OrdersTab({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    bloc.event.add(HomeEventGetOrders(context));

    return SafeArea(
      child: BlocScreenBuilder(
          stream: bloc.stateOrders,
          builder: (state) {
            if (state is BlocStableState) {
              List<OrdersEntity> list = state.data;
              return ListView(
                children: list
                    .map((e) =>
                        ExpansionTile(title: Text(e.totalPrice.toString())))
                    .toList(),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
    );
  }
}
