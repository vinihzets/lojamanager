import 'package:flutter/material.dart';
import '../../../../core/archiceture/bloc_builder.dart';
import '../../../../core/archiceture/bloc_state.dart';
import '../../data/dto/orders_dto.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../widgets/order_tile.dart';

class OrdersTab extends StatelessWidget {
  final HomeBloc bloc;

  const OrdersTab({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    bloc.event.add(HomeEventGetOrders(context));

    return SafeArea(
      child: BlocScreenBuilder(
          stream: bloc.stateOrders,
          builder: (state) {
            if (state is BlocStableState) {
              List<OrdersDto> list = state.data;
              return ListView(
                children: list
                    .map((e) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Card(
                            child: ExpansionTile(
                              title: Text(
                                '#${e.orderId} ${bloc.states[e.status]}',
                                style: const TextStyle(color: Colors.green),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 0, bottom: 8),
                                  child: Column(
                                    children: [
                                      OrderTile(
                                        order: e,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: e.products
                                            .map((e) => ListTile(
                                                  title: Text(
                                                      '${e.quantity} x ${e.name} ${e.size}'),
                                                  trailing:
                                                      Text('R\$ ${e.price}'),
                                                ))
                                            .toList(),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Status: ${e.status}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.white)),
                                              onPressed: () {},
                                              child: const Text(
                                                'Excluir',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.white)),
                                              onPressed: () {
                                                if (e.status < 2) {
                                                } else {
                                                  bloc.event.add(
                                                      HomeEventStatusDown(
                                                          context, e));
                                                }
                                              },
                                              child: const Text(
                                                'Regredir',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.white)),
                                              onPressed: () {
                                                if (e.status > 3) {
                                                } else {
                                                  bloc.event.add(
                                                      HomeEventStatusUp(
                                                          context, e));
                                                }
                                              },
                                              child: const Text(
                                                'Avancar',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
