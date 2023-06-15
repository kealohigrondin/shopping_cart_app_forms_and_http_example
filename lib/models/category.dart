import 'package:flutter/material.dart';

enum CategoryType {
  carbs,
  convenience,
  dairy,
  fruit,
  hygiene,
  meat,
  spices,
  sweets,
  other,
  vegetables,
}

class Category {
  const Category(this.title, this.color);
  
  final String title;
  final Color color;
}
