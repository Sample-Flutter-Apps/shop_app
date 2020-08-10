import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart' as oiw;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, idx) => oiw.OrderItem(ordersData.orders[idx]),
      ),
      drawer: AppDrawer(),
    );
  }
}