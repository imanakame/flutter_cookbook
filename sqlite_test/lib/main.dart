import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_test/main_model.dart';
import 'package:sqlite_test/repository/db_provider.dart';

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
                Text(model.tempTodoList.toString()),
                Text(model.todoList.length == 2 ? model.todoList[1]["name"] : ""),
                RaisedButton(
                  child: Text('DB作成'),
                  onPressed: () async {
                    await DBProvider.db.initDB();
                  },
                ),
                RaisedButton(
                  child: Text('DB新規作成'),
                  onPressed: () async {

                    final todo = Todo(
                      title: '追加',
                    );

                    DBProvider.db.insertTodo(todo);

                    final tempTodoList = await DBProvider.db.getTodo();

                    model.removeTempTodoList();
                    for (var i = 0; i < tempTodoList.length; i++) {
                      final todo = {"id": tempTodoList[i].id, "title": tempTodoList[i].title};
                      model.setTempTodoList(todo);
                    }

                  },
                ),
                RaisedButton(
                  child: Text('変更'),
                  onPressed: () async {

                    final todoList = await DBProvider.db.getTodo();

                    final updateTodoList = todoList[todoList.length - 1];

                    final todo = Todo(
                      id: updateTodoList.id,
                      title: '変更したよ',
                    );

                    DBProvider.db.updateTodo(todo);

                    final upTodoList = await DBProvider.db.getTodo();

                    model.removeTempTodoList();
                    for (var i = 0; i < upTodoList.length; i++) {
                      final todo = {"id": upTodoList[i].id, "title": upTodoList[i].title};
                      model.setTempTodoList(todo);
                    }
                  },
                ),
                RaisedButton(
                  child: Text('削除'),
                  onPressed: () async {

                    final todoList = await DBProvider.db.getTodo();

                    final deleteId = todoList[todoList.length - 1].id;

                    await DBProvider.db.deleteTodo(deleteId);

                    final tempTodoList = await DBProvider.db.getTodo();

                    model.removeTempTodoList();
                    for (var i = 0; i < tempTodoList.length; i++) {
                      final todo = {"id": tempTodoList[i].id, "title": tempTodoList[i].title};
                      model.setTempTodoList(todo);
                    }

                  },
                ),
                RaisedButton(
                  child: Text('DB削除'),
                  onPressed: () async {
                    await DBProvider.db.deleteDB();
                  },
                ),
              ],
            ),
          );
        })
    );
  }
}
