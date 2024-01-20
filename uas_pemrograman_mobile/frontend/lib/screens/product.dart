import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/category.dart';
import 'package:frontend/providers/product.dart';
import 'package:frontend/providers/tag.dart';
import 'package:frontend/screens/add_product.dart';
import 'package:frontend/screens/category.dart';
import 'package:frontend/screens/dashboard.dart';
import 'package:frontend/screens/manage_users.dart';
import 'package:frontend/screens/tag.dart';
import 'package:frontend/widgets/drawer.dart';

class Products extends ConsumerWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctgry = ref.watch(categoryProvider);
    final tg = ref.watch(tagProvider);

    final products = ref.watch(productProvider);
    ref.watch(productProvider.notifier).getProductData();

    print(products);
    Widget content = products.isEmpty
        ? const Center(
            child: Text('Data Product masih kosong, silahkan add product!'),
          )
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.tag,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const AddProduct(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
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
        },
      ),
      body: content,
    );
  }
}
