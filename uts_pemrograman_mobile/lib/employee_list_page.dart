import 'package:flutter/material.dart';
import 'package:uts_pemrograman_mobile/data/data_employees.dart';
import 'package:uts_pemrograman_mobile/employee_details.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key, required this.changeAppBar});
  final void Function(String) changeAppBar;

  @override
  State<EmployeeListPage> createState() {
    return _EmployeeListPage();
  }
}

class _EmployeeListPage extends State<EmployeeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(employees[index]['name']),
              subtitle: Text(employees[index]['position']),
              trailing: ElevatedButton(
                onPressed: () {
                  widget.changeAppBar('Employee Details');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EmployeeDetails(employee: employees[index]),
                    ),
                  ).then((_) {
                    widget.changeAppBar('Employee List Monitoring');
                  });
                },
                child: const Text('View'),
              ),
              onTap: () {
                widget.changeAppBar('Employee Details');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EmployeeDetails(employee: employees[index]),
                  ),
                ).then((_) {
                  widget.changeAppBar('Employee List Monitoring');
                });
              },
            ),
          );
        },
      ),
    );
  }
}


