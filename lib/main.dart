// import 'dart:developer';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

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

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asPascalCase)
        // title: Title(pair.toString()),
        );
  }

  Widget build(BuildContext context) {
    Widget _buildList() {
      return ListView.builder(
          // itemCount: 100,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final item = index ~/ 2;

            if (item >= _randomWordPairs.length) {
              _randomWordPairs.addAll(generateWordPairs().take(10));
            }
            if (index.isOdd) {
              return Divider(
                thickness: 2,
              );
            }

            return _buildRow(_randomWordPairs[item]);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        backgroundColor: Colors.purple[900],
      ),
      body: _buildList(),
    );
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
