import 'package:flutter/material.dart';
import 'package:uts_pemrograman_mobile/text_styled.dart';

class EmployeeDetails extends StatelessWidget {
  final Map<String, dynamic> employee;

  const EmployeeDetails({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 90,
                      ), // Example radius size
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StyledText(
                      txt: 'Name: ${employee['name']}',
                      color: Colors.black,
                    ),
                    StyledText(
                      txt: 'Position: ${employee['position']}',
                      color: Colors.black,
                    ),
                    StyledText(
                      txt: 'Email: ${employee['email']}',
                      color: Colors.black,
                    ),
                    StyledText(
                      txt: 'Phone: ${employee['phone']}',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Experienced (${employee['name']}) :'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et dolor in erat iaculis lacinia. Suspendisse potenti. Phasellus vestibulum tristique arcu, in suscipit ipsum. Pellentesque aliquet, libero sit amet tincidunt suscipit, dui sapien rhoncus neque, eget posuere lacus mi id felis. Proin ac tellus at lacus lobortis volutpat nec ut nisi. Vivamus euismod suscipit justo, eu convallis sem molestie eu. Duis convallis vel nisi a posuere. Ut pulvinar, leo non convallis consectetur, dolor nisi ultricies nulla, id aliquet magna lorem eget elit.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
