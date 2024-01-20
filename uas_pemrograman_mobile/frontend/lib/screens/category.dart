import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/category.dart';
import 'package:frontend/screens/add_category.dart';
import 'package:frontend/screens/dashboard.dart';
import 'package:frontend/screens/manage_users.dart';
import 'package:frontend/screens/product.dart';
import 'package:frontend/screens/tag.dart';
import 'package:frontend/widgets/drawer.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final dataCategory = ref.watch(categoryProvider);
    ref.watch(categoryProvider.notifier).getCategoryData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const AddCategory(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
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
          } else if (identifier == "products") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const Products(),
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
        },
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: DataTable(
                columnSpacing: 100,
                horizontalMargin: 40,
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Category Name')),
                ],
                rows: [
                  ...dataCategory.map(
                    (category) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            category.id.toString(),
                          ),
                        ),
                        DataCell(
                          Text(category.name),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
