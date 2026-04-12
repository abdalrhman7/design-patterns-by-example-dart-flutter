import 'package:flutter/material.dart';

/// One runnable example inside a design pattern tile.
class ExampleItem {
  final String title;
  final String subtitle;
  final Widget screen;

  const ExampleItem({
    required this.title,
    required this.subtitle,
    required this.screen,
  });
}

/// One expandable pattern (e.g. Strategy) with its examples.
class PatternItem {
  final String name;
  final String description;
  final List<ExampleItem> examples;

  const PatternItem({
    required this.name,
    required this.description,
    required this.examples,
  });
}

/// A GoF-style group: Behavioral, Creational, or Structural.
class PatternCategory {
  final String name;
  final String info;
  final List<PatternItem> patterns;

  const PatternCategory({
    required this.name,
    required this.info,
    required this.patterns,
  });
}
