import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DetailWidget.dart';

void main() {
  // 横屏模式禁掉是在AndroidManifest.xml中设置了 todo 后续要不要考虑横屏的布局问题
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'i复习',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'i复习'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('i复习'),
        ),
        body: new _ListWidget(itemSelectedCallback: (value) {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new DetailWidget(value);
          }));
        }));
  }
}

var titles = [
  'y = a * x + b',
  'y = a * x ^ 2 + b * x + c',
  'y = k / x',
  'y = a * sin(b * x)',
  'y = a ^ x',
  'y = log x',
];

// 一次函数，二次函数，反比例函数，三角函数，指数函数，对数函数

typedef Null ItemSelectedCallback(int value);

//列表的Widget
class _ListWidget extends StatelessWidget {
  final ItemSelectedCallback itemSelectedCallback;

  _ListWidget({@required this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
        itemCount: titles.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
              title: new Text(titles[index]),
              onTap: () {
                this.itemSelectedCallback(index);
              });
        });
  }
}
