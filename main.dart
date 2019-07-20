import 'package:flutter/material.dart';
import 'package:cheetah_check_mobile/ui/homeRouter.dart';

void main() => runApp(CheetahCheck());

class CheetahCheck extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Colors.amberAccent,
        accentColor: Colors.brown,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      title: 'Cheetah Check-In System',
      home: Home(
        title: 'Welcome!'
      ),
    );
  }
}





//class RandomWordsState extends State<RandomWords> {
//  final _suggestions = <WordPair>[];
//  final _biggerFont = const TextStyle(fontSize: 18.0);
//  final _saved = Set<WordPair>();
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Name Generator'),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: _buildSuggestions(),
//    );
//  }
//  void _pushSaved() {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          final Iterable<ListTile> tiles = _saved.map(
//                (WordPair pair) {
//              return ListTile(
//                title: Text(
//                  pair.asPascalCase,
//                  style: _biggerFont,
//                ),
//              );
//            },
//          );
//          final List<Widget> divided = ListTile
//              .divideTiles(
//            context: context,
//            tiles: tiles,
//          )
//              .toList();
//
//          return Scaffold(
//            appBar: AppBar(
//              title: Text('Saved Suggestions'),
//            ),
//            body: ListView(children: divided),
//          );
//        },
//      ),
//    );
//  }
//
//  Widget _buildSuggestions() {
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: /*1*/ (context, i) {
//          if (i.isOdd) return Divider(); /*2*/
//
//          final index = i ~/ 2; /*3*/
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//          }
//          return _buildRow(_suggestions[index]);
//        });
//  }
//
//  Widget _buildRow(WordPair pair) {
//    final bool alreadySaved = _saved.contains(pair);
//    return ListTile(
//        title:  Text(
//          pair.asPascalCase,
//          style: _biggerFont,
//        ),
//        trailing: Icon(
//          alreadySaved ? Icons.favorite : Icons.favorite_border,
//          color: alreadySaved ? Colors.pink : null,
//        ),
//        onTap: () {
//          setState(() {
//            if (alreadySaved) {
//              _saved.remove(pair);
//            } else {
//              _saved.add(pair);
//            }
//          });
//        }
//    );
//  }
//}
//
//class RandomWords extends StatefulWidget {
//  @override
//  RandomWordsState createState() => RandomWordsState();
//}
