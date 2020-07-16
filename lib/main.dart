import 'package:flutter/material.dart';
import 'screens/filmlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'omdb_app',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Movie Search'),
          ),
          body: FilmList()
      ),
    );
  }
}
