import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryNotifier() : super([]);

  Future<void> getCategoryData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/api/category'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      final List<CategoryModel> categories =
          jsonData.map((category) => CategoryModel.fromJson(category)).toList();

      state = categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<CategoryModel>>(
        (ref) => CategoryNotifier());
