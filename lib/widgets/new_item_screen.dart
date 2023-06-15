import 'package:flutter/material.dart';
import 'package:shopping_cart_app_forms_and_http_example/data/categories.dart';
import 'package:shopping_cart_app_forms_and_http_example/models/category.dart';
import 'package:shopping_cart_app_forms_and_http_example/models/grocery_item.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();

  var _enteredName = '';
  var _enteredQuantity = 0;
  var _selectedCategory = categories[CategoryType.carbs];

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop<GroceryItem>(GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: _enteredName,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Name'),
                    ),
                    validator: (value) {
                      //return null if valid
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length > 50) {
                        return 'Must be between 1 and 50 characters';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredName = newValue!;
                    },
                  ), //extends TextField functionality
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                            initialValue: _enteredQuantity.toString(),
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(label: Text('Quantity')),
                            validator: (value) {
                              //return null if valid
                              if (value == null ||
                                  value.isEmpty ||
                                  int.tryParse(value) == null ||
                                  int.tryParse(value)! <= 0) {
                                return 'Must be greater than 0';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredQuantity = int.tryParse(newValue!)!;
                            }),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField(
                            value: _selectedCategory,
                            items: [
                              for (final cat in categories.entries)
                                DropdownMenuItem(
                                  value: cat.value,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 10,
                                          height: 10,
                                          color: cat.value.color),
                                      const SizedBox(width: 10),
                                      Text(cat.value.title),
                                    ],
                                  ),
                                )
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                          },
                          child: const Text('Reset')),
                      ElevatedButton(
                          onPressed: _saveItem, child: const Text('Add Item'))
                    ],
                  )
                ],
              ))),
    );
  }
}
