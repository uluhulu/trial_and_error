import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_and_error/topics/provider/catalog/state_managment/cart_notifier.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartNotifier = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: cartNotifier.items.length,
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('- ${cartNotifier.items[index].name}'),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                cartNotifier.removeAll();
              },
              child: const Text('Clear all'),
            ),
          ),
        ],
      ),
    );
  }
}
