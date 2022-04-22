// import 'dart:developer';
// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import './random_words.dart' show RandomWords;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: RandomWords());
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           title: const Text('Flutter Roxk!'),
//         ),
//         body: Center(
//           child: Stack(
//             children: [
//               Container(
//                 color: Colors.blue[100],
//                 margin: const EdgeInsets.all(10),
//               ),
//               const Positioned(
//                 child: Icon(Icons.back_hand),
//                 top: 30,
//                 left: 35,
//               )

//               // Icon(Icons.backpack),
//               // Icon(Icons.person),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(onPressed: () {
//           log('message');
//         }),
//       ),
//     );
//   }
// }
