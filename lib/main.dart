import 'package:package_delivery/Routes.dart';

void main() {
  new Routes();
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Startup Name Generator',
//       home: LoginPage(),
//       theme: ThemeData(
//         primaryColor: Colors.green,
//       ),
//     );
//   }
// }

// class RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final Set<WordPair> _saved = Set<WordPair>();
//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   final Future<Post> post = fetchPost();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Startup Name Generator'),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//           IconButton(icon: Icon(Icons.access_alarm), onPressed: _pushColumn)
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }
//   void _pushColumn() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(
//               title:  Text("Testcolumn"),
//             ),
//             body: Column(
//               children: <Widget>[
//                 Text('Deliver features faster'),
//                 Text('Craft beatufdskfaj'),
//                 Expanded(
//                   child: FittedBox(
//                     fit: BoxFit.contain,
//                     child: const FlutterLogo(),
//                   ),
//                 )
//               ],
//             ),
//           );
//         }
//       )
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
//             return ListTile(
//               title: Text(
//                 pair.asPascalCase,
//                 style: _biggerFont,
//               ),
//             );
//           });
//           final List<Widget> divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();

//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Saved Suggestions'),
//             ),
//             // body:  ListView(children: divided),
//             body: Container(
//               child: Stack(
//                 children: <Widget>[
//                     ListView(children: divided),
//                     Center(
//                       child: FutureBuilder<Post>(
//                         future: post,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return Center(
//                               child: Text(snapshot.data.title),
//                             );
//                           } else if (snapshot.hasError) {
//                             return Center(
//                               child: Text("${snapshot.error}"),
//                             );
//                           }

//                           return CircularProgressIndicator();
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: (coontext, i) {
//           if (i.isOdd) return Divider();

//           final index = i ~/ 2;
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }

//   Widget _buildRow(WordPair pair) {
//     final bool alreadySaved = _saved.contains(pair);
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: () {
//         setState(() {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   RandomWordsState createState() => RandomWordsState();
// }

// Future<Post> fetchPost() async {
//   final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');

//   if (response.statusCode == 200) {
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load post');
//   }
// }

// class Post {
//   final int userId;
//   final int id;
//   final String title;
//   final String body;

//   Post({this.userId, this.id, this.title, this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }
