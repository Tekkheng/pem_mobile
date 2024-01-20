import 'package:flutter/material.dart';
// import 'package:frontend/datasementara/category.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});
  @override
  State<AddCategory> createState() {
    return _AddCategory();
  }
}

class _AddCategory extends State<AddCategory> {
  final formKey = GlobalKey<FormState>();

  String _enteredName = "";

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    print(_enteredName);

    final url = Uri.parse('http://10.0.2.2/api/category');

    Map<String, String> data = {
      'name': _enteredName,
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
              title: const Text("add category success"),
              content: const Text("data category bertambah!"),
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
              title: const Text("add category failed"),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 20,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().length <= 1 ||
                      value.trim().length > 20) {
                    return "Name must be between 1 and 20 characters!";
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                children: [
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
