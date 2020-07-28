import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_notifier_provider/main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainModel()),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(
          // テーマカラー
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.menu),
          title: const Text('provider'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                //
              },
            ),
          ],
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          return Center(
            child: Column(
              children: [
                Text(model.todoList[0]["name"]),
                Text(model.todoList.length == 2 ? model.todoList[1]["name"] : ""),
                RaisedButton(
                  child: Text('追加'),
                  onPressed: () {
                    // ここでなにか
                    if(model.todoList.length == 1) {
                      model.addTask({"name": "追加したよ"});
                    }
                  },
                ),
                RaisedButton(
                  child: Text('変更'),
                  onPressed: () {
                    // ここでなにか
                    model.changeTask(0, "変更したよ");
                  },
                ),
                RaisedButton(
                  child: Text('削除'),
                  onPressed: () {
                    // ここでなにか
                    if(model.todoList.length == 2) {
                      model.removeTask(0);
                    }
                  },
                ),
              ],
            ),
          );
        })
    );
  }
}


