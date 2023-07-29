import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/shared/data/app_data.dart';
import 'package:greengrocer/src/shared/theme/app_colors.dart';
import 'package:greengrocer/src/shared/widgets/order_tile_widget.dart';

class OrdersTab extends StatelessWidget {
  OrdersTab({super.key});

  final List<OrderModel> orders = AppData().getOrders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          'Pedidos',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.customContrastColor,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => OrderTileWidget(order: orders[index]),
        separatorBuilder: (_, __) => SizedBox(
          height: 10,
        ),
        itemCount: orders.length,
      ),
    );
  }
}
