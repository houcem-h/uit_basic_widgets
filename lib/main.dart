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
  int _selectedIndex = 0;
  String _displayText = "0: Home Screen";

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

  void _clickedItemOnNavigationBar(int ind) {
    setState(() {
      _selectedIndex = ind;
      switch (_selectedIndex) {
        case 0:
          {
            _displayText = '$_selectedIndex : Home Screen';
          }
          break;
        case 1:
          {
            _displayText = '$_selectedIndex : Account Screen';
          }
          break;
        case 2:
          {
            _displayText = '$_selectedIndex : Statistics Screen';
          }
          break;
      }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_displayText',
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _heart,
        onPressed: _likeThis,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrangeAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white),
            label: 'Account'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment, color: Colors.white),
            label: 'Statistics'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _clickedItemOnNavigationBar,
      ),
      /*bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrangeAccent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_location_alt, color: Colors.white),
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
