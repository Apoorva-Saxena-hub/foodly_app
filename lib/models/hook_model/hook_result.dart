import 'package:flutter/material.dart';
import 'package:foodly_app/models/categories.dart';

class FetchHook {
  final List<CategoryModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchHook({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
