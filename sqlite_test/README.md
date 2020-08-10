## sqliteの利用方法

### sqliteパッケージの利用方法

参考：

1.pubspec.yamlファイルの編集
※バージョン指定したい場合は、下記にパッケージ情報が載っています。
https://pub.dev/packages/sqflite/install
https://pub.dev/packages/path_provider/install

```dart
dependencies:
  sqflite: ^1.3.0
  path_provider: ^1.6.11
```

2.インストール
ターミナルで下記を実行する
```
$ flutter pub get
```

3.main.dartに下記を追加

```dart
import 'package:sqflite/sqflite.dart';
```

sqliteの中身を確認したい

DB Browser for SQLiteというアプリを利用する
https://sqlitebrowser.org/

参考URL
「data」->「data」->「作成したアプリのドメイン名」->「com.example.sqlite_test」
https://www.virment.com/view-sqlite-database-by-android-studio/

または、SQLScout ​(SQLite Support)​というAndroid Studioのプラグインでも確認できます。
https://plugins.jetbrains.com/plugin/8322-sqlscout-sqlite-support-/
