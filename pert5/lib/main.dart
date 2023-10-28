import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Help {
  String title;
  bool isDone;

  Help({required this.title, this.isDone = false});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  // _MyAppState createState() => _MyAppState();
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Help> help = [];
  TextEditingController helpController = TextEditingController();

  void addHelp() {
    String newHelp = helpController.text.trim();
    if (newHelp.isNotEmpty) {
      setState(() {
        help.add(Help(title: newHelp));
        helpController.clear();
      });
    }
  }

  void removeHelp(int index) {
    setState(() {
      help.removeAt(index);
    });
  }

  void toggleHelp(int index) {
    setState(() {
      help[index].isDone = !help[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pertemuan 5'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: help.length,
              itemBuilder: (context, index) {
                // Use an anonymous function here
                return ListTile(
                  leading: Checkbox(
                    value: help[index].isDone,
                    onChanged: (bool? value) {
                      toggleHelp(index);
                    },
                  ),
                  title: Text(
                    help[index].title,
                    style: TextStyle(
                      decoration: help[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      removeHelp(index);
                    },
                  ),
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: helpController,
                      decoration: const InputDecoration(
                        hintText: 'Input Text!',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: addHelp,
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
