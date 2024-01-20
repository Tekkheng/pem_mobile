import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/user.dart';
import 'package:frontend/screens/category.dart';
import 'package:frontend/screens/manage_users.dart';
import 'package:frontend/screens/product.dart';
import 'package:frontend/screens/tag.dart';
import 'package:frontend/widgets/drawer.dart';

class DashBoard extends ConsumerWidget {
  const DashBoard({super.key});

  void _changeScreen(String identifier, BuildContext context) {
    Navigator.pop(context);
    if (identifier == "products") {
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
    } else if (identifier == "manage_users") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const ManageUsers(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLogin = ref.watch(userProvider);
    final name = userLogin['user']!.name;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Uas Pemrograman Mobile"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      drawer: MainDrawer(changeScreen: _changeScreen),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to DashBoard $name !'),
          ],
        ),
      ),
    );
  }
}
