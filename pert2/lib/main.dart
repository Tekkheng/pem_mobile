// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       MyApp: const MyMyAppPage(title: 'Flutter Demo MyApp Page'),
//     );
//   }
// }
//
// class MyMyAppPage extends StatefulWidget {
//   const MyMyAppPage({super.key, required this.title});
//
//   // This widget is the MyApp page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyMyAppPage> createState() => _MyMyAppPageState();
// }
//
// class _MyMyAppPageState extends State<MyMyAppPage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyMyAppPage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


//// menampilkan text hello world :
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     const Center(
//       child: Text(
//         'Hello, world!',
//         textDirection: TextDirection.ltr,
//       ),
//     ),
//   );
// }

//// basic widget
// import 'package:flutter/material.dart';
//
// class MyAppBar extends StatelessWidget {
//   const MyAppBar({required this.title, super.key});
//
//   // Fields in a Widget subclass are always marked "final".
//
//   final Widget title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56, // in logical pixels
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(color: Colors.lightGreen[600]),
//       // Row is a horizontal, linear layout.
//       child: Row(
//         children: [
//           const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null, // null disables the button
//           ),
//           // Expanded expands its child
//           // to fill the available space.
//           Expanded(
//             child: title,
//           ),
//           const IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyScaffold extends StatelessWidget {
//   const MyScaffold({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Material is a conceptual piece
//     // of paper on which the UI appears.
//     return Material(
//       // Column is a vertical, linear layout.
//       child: Column(
//         children: [
//           MyAppBar(
//             title: Text(
//               'Pertemuan 2',
//               style: Theme.of(context) //
//                   .primaryTextTheme
//                   .titleLarge,
//             ),
//           ),
//           const Expanded(
//             child: Center(
//               child: Text('Hello, Tek Kheng!'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'My app', // used by the OS task switcher
//       MyApp: SafeArea(
//         child: MyScaffold(),
//       ),
//     ),
//   );
// }


//// menggunakan material component
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Pertemuan 2'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: const Center(
        child: Text('Hello, World!'),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
