import 'package:flutter/material.dart';

class Type {
  final String title;
  final String? subtitle;
  final String? description;
  final String? image;
  final IconData? icon;
  final List<Color> colors;
  final String routeName;
  Type({
    required this.title,
    required this.subtitle,
    this.description,
    this.image,
    this.icon,
    required this.colors,
    required this.routeName,
  });
}
