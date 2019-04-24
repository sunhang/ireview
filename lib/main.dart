import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DetailWidget.dart';

void main() {
  // todo 先把横屏模式给禁掉，回头查查横屏下布局的问题
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
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
  bool isLargeScreen;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('i复习'),
        ),
        body: new OrientationBuilder(builder: (context, orientation) {
          print("width:${MediaQuery.of(context).size.width}");
          //判断屏幕宽度
          if (MediaQuery.of(context).size.width > 600) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }

          return new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Expanded(
                  child: new _ListWidget(itemSelectedCallback: (value) {
                if (isLargeScreen) {
                  setState(() {});
                } else {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return new DetailWidget(value);
                  }));
                }
              })),
              isLargeScreen
                  ? new Expanded(child: new DetailWidget(1))
                  : new Container()
            ],
          );
        }));
  } //是否是大屏幕

}

var titles = [
  'He\'d have you all unravel at the',
  'Heed not the rabble',
  'Sound of screams but the',
  'Who scream',
  'Revolution is coming...',
  'Revolution, they...',
];

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
