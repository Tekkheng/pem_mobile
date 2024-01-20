import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/category.dart';
import 'package:frontend/models/tag.dart';
import 'package:frontend/providers/category.dart';
import 'package:frontend/providers/tag.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddProduct extends ConsumerStatefulWidget {
  const AddProduct({super.key});
  @override
  ConsumerState<AddProduct> createState() {
    return _AddProduct();
  }
}

class _AddProduct extends ConsumerState<AddProduct> {
  final formKey = GlobalKey<FormState>();
  String _enteredName = "";
  int _enteredPrice = 1;
  String _enteredImage = "";
  CategoryModel? _selectedCategory;
  TagModel? _selectedTags;

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    print(
        '$_enteredName, $_enteredPrice, $_selectedCategory}, $_selectedTags,$_enteredImage');

    final url = Uri.parse('http://10.0.2.2/api/product');

    Map<String, dynamic> data = {
      'name': _enteredName,
      'price': _enteredPrice,
      'category': _selectedCategory!.name,
      'tag': _selectedTags!.name,
      'image': _enteredImage,
    };

    try {
      final response = await http.post(
        url,
        body: json.encode(data),
        headers: {
          'Content-Type':
              'application/json', // Tentukan tipe konten sebagai JSON
        },
      );
      if (response.statusCode == 200) {
        formKey.currentState!.reset();
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("add product success"),
              content: const Text("data product bertambah!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"),
                )
              ],
            ),
          );
        }
      } else {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("add product failed"),
              content: Text(response.body),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"),
                )
              ],
            ),
          );
        }
      }
    } catch (err) {
      return print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctgry = ref.watch(categoryProvider);
    final tg = ref.watch(tagProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: ctgry
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: TextFormField(
                      maxLength: 40,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        label: Text("Image"),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "image tidak boleh kosong!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredImage = value!;
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 40,
                      decoration: const InputDecoration(
                        label: Text("Name"),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().length <= 1 ||
                            value.trim().length > 50) {
                          return "Name must be between 1 and 50 characters!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredName = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedTags,
                      items: tg
                          .map(
                            (tag) => DropdownMenuItem(
                              value: tag,
                              child: Text(tag.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedTags = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 40,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Price"),
                      ),
                      validator: (value) {
                        if (value == null ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be valid, positive number.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredPrice = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    onPressed: onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      foregroundColor: Theme.of(context).colorScheme.background,
                    ),
                    child: const Text("Create"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
