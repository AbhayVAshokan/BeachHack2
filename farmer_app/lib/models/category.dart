import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final dummyType;

  const Category({
    @required this.id,
    @required this.title,
    @required this.dummyType,
    this.color = Colors.orange,
  });
}
