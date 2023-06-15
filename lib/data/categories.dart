import 'package:flutter/material.dart';

import 'package:shopping_cart_app_forms_and_http_example/models/category.dart';

const Map<CategoryType,Category> categories = {
  CategoryType.carbs: Category(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  CategoryType.convenience: Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  CategoryType.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  CategoryType.fruit: Category(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  CategoryType.hygiene: Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  CategoryType.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  CategoryType.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  CategoryType.sweets: Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  CategoryType.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  CategoryType.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
