import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product.dart';
import 'package:http/http.dart' as http;

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super([]);

  Future<void> getProductData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/api/product'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      final List<ProductModel> products =
          jsonData.map((product) => ProductModel.fromJson(product)).toList();

      state = products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>(
        (ref) => ProductNotifier());
