import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.changeScreen});

  final void Function(String, BuildContext) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      // width: 200,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              onTap: () {
                changeScreen("dashboard", context);
              },
              leading: Icon(Icons.home,
                  color: Theme.of(context).colorScheme.primaryContainer),
              title: Text(
                "DashBoard",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Shop",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          ListTile(
            onTap: () {
              changeScreen("products", context);
            },
            leading: Icon(Icons.shopping_bag_outlined,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              "Products",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text(
              "Setting Product",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          ListTile(
            onTap: () {
              changeScreen("categories", context);
            },
            leading: Icon(Icons.category,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              "Categories",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          ListTile(
            onTap: () {
              changeScreen("tags", context);
            },
            leading: Icon(Icons.tag,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              "Tags",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text(
              "Management User",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              changeScreen("manage_users", context);
            },
            leading: Icon(Icons.person,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              "Users",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
