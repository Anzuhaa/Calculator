import 'package:flutter/material.dart';

class ModelContent {
  final String name;
  final VoidCallback action;

  ModelContent(
    this.name,
    this.action,
  );
}
