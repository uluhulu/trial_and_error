import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_and_error/topics/provider/models/item.dart';
import 'package:trial_and_error/topics/provider/screens/cart_screen.dart';
import 'package:trial_and_error/topics/provider/state_managment/cart_notifier.dart';

const List<Item> itemList = [
  Item(name: 'Book 1'),
  Item(name: 'Book 2'),
  Item(name: 'Book 3'),
  Item(name: 'Book 4'),
  Item(name: 'Book 5'),
  Item(name: 'Book 6'),
  Item(name: 'Book 7'),
  Item(name: 'Book 8'),
  Item(name: 'Book 9'),
  Item(name: 'Book 10'),
];

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatalogView();
  }
}

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: const Catalog(),
    );
  }
}

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(itemList[index].name),
              const Spacer(),
              Consumer<CartNotifier>(
                builder: (
                  BuildContext context,
                  CartNotifier value,
                  Widget? child,
                ) {
                  return value.items.contains(itemList[index])
                      ? const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.check,
                          ))
                      : IconButton(
                          onPressed: () => value.add(
                            itemList[index],
                          ),
                          icon: const Icon(
                            Icons.add,
                          ),
                        );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
