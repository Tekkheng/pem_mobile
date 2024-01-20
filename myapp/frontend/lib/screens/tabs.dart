import 'package:flutter/material.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/screens/profile.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _pageIndx = 0;

  void _selectPage(int indx) {
    setState(() {
      _pageIndx = indx;
    });
  }

  @override
  Widget build(BuildContext context) {
  // print(widget.dataLogin);
    String pageTitle = "HomePage";
    Widget currentScreen = const Home();
    if (_pageIndx == 1) {
      pageTitle = "Profile";
      currentScreen = const Profile();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(pageTitle)),
        actions: _pageIndx == 1
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.logout),
                ),
              ]
            : [],
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indx) => _selectPage(indx),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
        currentIndex: _pageIndx,
      ),
    );
  }
}
