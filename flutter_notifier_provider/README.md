## flutter ChangeNotifierProviderの利用方法

### ChangeNotifierProviderパッケージの利用方法

参考：https://pub.dev/packages/provider

1.pubspec.yamlファイルの編集

```dart
dependencies:
  provider: ^4.3.1
```

2.インストール
$ flutter pub get
ターミナルで実行

3.main.dartに下記を追加
import 'package:provider/provider.dart';
