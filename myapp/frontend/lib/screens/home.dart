import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/user.dart';
// import 'package:frontend/screens/model/user.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class Home extends ConsumerStatefulWidget {
  const Home({super.key});
  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  // List<UserModel> data = [];

  // @override
  // void initState() {
  //   getUser();
  //   super.initState();
  // }
  // Future<void> getUser() async {
  //   try {
  //     final url = Uri.parse("http://10.0.2.2/api/login");
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body) as List;
  //       if (jsonData.isNotEmpty) {
  //         final dat = jsonData.first;
  //         final name = dat['name'].toString();
  //         final email = dat['email'].toString();
  //         setState(() {
  //           // data = [
  //           //   'Name : $name',
  //           //   'Email : $email',
  //           // ];

  //           data.add(
  //             UserModel(
  //               name: name,
  //               email: email,
  //             ),
  //           );
  //         });
  //       }
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final userLogin = ref.watch(userProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(userLogin.name.isNotEmpty && userLogin.email.isNotEmpty
              ? "Welcome To HomePage ${userLogin.name}"
              : "User Failed Login!"),
        ),
      ],
    );
  }
}
