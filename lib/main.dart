import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _heart = Icon(Icons.favorite_border, color: Colors.white);
  bool _like = false;

  void _likeThis() {
    setState(() {
      /*if(_like) {
        _heart  = Icon(Icons.favorite, color: Colors.white);
      } else {
        _heart  = Icon(Icons.favorite_border, color: Colors.white);
      }*/
      // ou bien
      _heart = _like ? const Icon(Icons.favorite, color: Colors.white) : const Icon(Icons.favorite_border, color: Colors.white);
      _like = !_like;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UIT Flutter 2022'),
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          IconButton(
              onPressed: _likeThis,
              icon: _heart,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: _heart,
        onPressed: _likeThis,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
