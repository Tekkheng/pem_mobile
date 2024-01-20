import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/tag.dart';
import 'package:frontend/screens/add_tag.dart';
import 'package:frontend/screens/category.dart';
import 'package:frontend/screens/dashboard.dart';
import 'package:frontend/screens/manage_users.dart';
import 'package:frontend/screens/product.dart';
import 'package:frontend/widgets/drawer.dart';

class TagsScreen extends ConsumerWidget {
  const TagsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataTag = ref.watch(tagProvider);
    ref.watch(tagProvider.notifier).getTagData();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const AddTag(),
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
          } else if (identifier == "categories") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const CategoriesScreen(),
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
                  DataColumn(label: Text('Tags Name')),
                ],
                rows: [
                  ...dataTag.map(
                    (tag) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            tag.id.toString(),
                          ),
                        ),
                        DataCell(
                          Text(tag.name),
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
