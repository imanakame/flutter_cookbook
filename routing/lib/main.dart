import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'routing Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/listPage': (context) => ListPage(),
          '/addPage': (context) => AddPage(),
        },
      );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              children: [
                Text("メインページ"),
                RaisedButton(
                  child: Text('リストページへ'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/listPage');
                  },
                ),
              ],
            ),
          ),
        );
  }
}

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("リストページ"),
            RaisedButton(
              child: Text('追加ページへ'),
              onPressed: () {
                Navigator.pushNamed(context, '/addPage');
              },
            ),
            RaisedButton(
              child: Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        ],
        ),
      ),
    );
  }
}

class AddPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("追加ページ"),
            RaisedButton(
              child: Text('メインページへ'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            RaisedButton(
              child: Text('戻る'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
