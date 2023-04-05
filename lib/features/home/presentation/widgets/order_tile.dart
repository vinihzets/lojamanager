import 'package:flutter/material.dart';

import '../../domain/entities/orders_entity.dart';

class OrderTile extends StatelessWidget {
  final OrdersEntity order;
  const OrderTile({required this.order, super.key});

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
            Text('Desconto: ${order.discount.toStringAsFixed(2)}'),
            Text('Preco Final: ${order.totalPrice.toStringAsFixed(2)}'),
          ],
        )
      ],
    );
  }
}
