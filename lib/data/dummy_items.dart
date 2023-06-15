import 'package:shopping_cart_app_forms_and_http_example/models/grocery_item.dart';
import 'package:shopping_cart_app_forms_and_http_example/models/category.dart';
import 'package:shopping_cart_app_forms_and_http_example/data/categories.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[CategoryType.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[CategoryType.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[CategoryType.meat]!),
];
