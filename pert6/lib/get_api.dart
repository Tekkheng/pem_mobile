import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() {
    return _GetApiState();
  }
}

class _GetApiState extends State<GetApi> {
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://uts.djambred.my.id/api/student'),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List;
        if (jsonData.isNotEmpty) {
          final firstData = jsonData.first;
          final name = firstData['name'].toString();
          final email = firstData['email'].toString();
          final password = firstData['password'].toString();
          final createdAt = firstData['created_at'].toString();
          final updatedAt = firstData['updated_at'].toString();
          setState(() {
            data = [name,email,password,createdAt,updatedAt];
          });
        }
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? const Center(
            child: Text('Data Api Masih Kosong!'),
          )
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]),
              );
            },
          );
  }
}


// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://uts.djambred.my.id/api/student'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//     );
//   }
// }

// // void main() => runApp(const MyApp());

// class GetApi extends StatefulWidget {
//   const GetApi({super.key});

//   @override
//   State<GetApi> createState() => _GetApi();
// }

// class _GetApi extends State<GetApi> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<Album>(
//         future: futureAlbum,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Text(snapshot.data!.title);
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }

//           // By default, show a loading spinner.
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }
