import 'package:flutter/material.dart';
import 'package:uts_pemrograman_mobile/employee_list_page.dart';
import 'package:uts_pemrograman_mobile/attendance_page.dart';
import 'package:uts_pemrograman_mobile/reports_page.dart';

class HandlerScreen extends StatefulWidget {
  const HandlerScreen({super.key});

  @override
  State<HandlerScreen> createState() {
    return _HandlerScreen();
  }
}

class _HandlerScreen extends State<HandlerScreen> {
  int _currentIndex = 0;
  var judulAppBar = 'Employee List Monitoring';

  void setTitleAppBar(String value) {
    setState(() {
      judulAppBar = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      EmployeeListPage(changeAppBar: setTitleAppBar),
      const AttendancePage(),
      const ReportsPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(judulAppBar),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          if (_currentIndex == 1) {
            setTitleAppBar('Employee Attendance');
          } else if (_currentIndex == 2) {
            setTitleAppBar('Employee Reports');
          } else{
            setTitleAppBar('Employee List Monitoring');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Employees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
        ],
      ),
    );
  }
}