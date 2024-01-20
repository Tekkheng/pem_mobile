import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/tag.dart';
import 'package:http/http.dart' as http;

class TagNotifier extends StateNotifier<List<TagModel>> {
  TagNotifier() : super([]);

  Future<void> getTagData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/api/tag'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      final List<TagModel> tags =
          jsonData.map((tag) => TagModel.fromJson(tag)).toList();

      state = tags;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

final tagProvider =
    StateNotifierProvider<TagNotifier, List<TagModel>>(
        (ref) => TagNotifier());
