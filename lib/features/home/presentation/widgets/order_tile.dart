import 'package:flutter/material.dart';

import '../../domain/entities/orders_entity.dart';

class OrderTile extends StatelessWidget {
  OrdersEntity order;
  OrderTile({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(order.user),
          ],
        ),
        Column(
          children: [
            Text('Preco Total: ${order.totalPrice.toStringAsFixed(2)}'),
          ],
        )
      ],
    );
  }
}
