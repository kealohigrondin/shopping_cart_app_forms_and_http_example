import 'package:flutter/material.dart';
import 'package:shopping_cart_app_forms_and_http_example/data/dummy_items.dart';
import 'package:shopping_cart_app_forms_and_http_example/models/grocery_item.dart';
import 'package:shopping_cart_app_forms_and_http_example/widgets/new_item_screen.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<GroceryItem> _groceryItems = groceryItems;

  void _onAddPressed() async {
    final GroceryItem newItem = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItemScreen()));

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem g) {
    setState(() {
      _groceryItems.remove(g);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: ((ctx, index) => Dismissible(
                key: ValueKey(_groceryItems[index].id),
                onDismissed: (direction) {
                  _removeItem(_groceryItems[index]);
                },
                child: ListTile(
                    title: Text(_groceryItems[index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: _groceryItems[index].category.color,
                    ),
                    trailing: Text(_groceryItems[index].quantity.toString())),
              )));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(onPressed: _onAddPressed, icon: const Icon(Icons.add)),
          ],
        ),
        body: content);
  }
}
