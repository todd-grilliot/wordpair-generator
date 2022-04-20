import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 20.0)),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () => {
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        })
      },
      // title: Title(pair.toString()),
    );
  }

  Widget build(BuildContext context) {
    Widget _buildList() {
      return ListView.builder(
          itemCount: 1000,
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

    void _pushSaved() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
          return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 30.0)),
          );
        });
        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return Scaffold(
          appBar: AppBar(title: Text('Saved Wordpairs')),
          body: ListView(
            children: divided,
          ),
        );
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
        ],
        backgroundColor: Colors.purple[900],
      ),
      body: _buildList(),
    );
  }
}
