import 'package:flutter/material.dart';
import 'package:frontend/screens/category.dart';
import 'package:frontend/screens/dashboard.dart';
import 'package:frontend/screens/product.dart';
import 'package:frontend/screens/tag.dart';
import 'package:frontend/widgets/drawer.dart';

class ManageUsers extends StatelessWidget {
  const ManageUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserManage Page"),
      ),
      drawer: MainDrawer(
        changeScreen: (identifier, context) {
          if (identifier == "dashboard") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => const DashBoard(),
              ),
            );
          }
          else if (identifier == "products") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const Products(),
              ),
            );
          } else if (identifier == "categories") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const CategoriesScreen(),
              ),
            );
          } else if (identifier == "tags") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const TagsScreen(),
              ),
            );
          }
        },
      ),
      body: const Text("Halaman ManageUser"),
    );
  }
}
