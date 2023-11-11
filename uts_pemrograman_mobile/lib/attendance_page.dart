import 'package:flutter/material.dart';
import 'package:uts_pemrograman_mobile/data/data_employees.dart';
import 'package:uts_pemrograman_mobile/text_styled.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: Border.all(color: const Color.fromARGB(56, 0, 0, 0)),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(employees[index]['name']),
                    subtitle: Text(employees[index]['position']),
                    trailing: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check),
                      label: const Text(''),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      // border: Border.all(color: Color.fromARGB(58, 0, 0, 0)),
                      color: Color.fromARGB(19, 0, 0, 0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyledText(
                                txt: 'Arrival',
                                color: Color.fromARGB(107, 0, 0, 0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StyledText(
                                txt: '9:00 a.m',
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              StyledText(
                                txt: 'Departure',
                                color: Color.fromARGB(107, 0, 0, 0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StyledText(
                                txt: '5:00 p.m',
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              StyledText(
                                txt: 'Extras',
                                color: Color.fromARGB(107, 0, 0, 0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StyledText(
                                txt: '0:00h',
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              StyledText(
                                txt: 'Late',
                                color: Color.fromARGB(107, 0, 0, 0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StyledText(
                                txt: '0:00h',
                                color: Colors.blueAccent,
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
        },
      ),
    );
  }
}
