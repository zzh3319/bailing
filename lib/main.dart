import 'package:flutter/material.dart';
import 'package:bailingapp/mine/MineWidget.dart';
import 'package:bailingapp/workPlatform/WorkPlatform.dart';
import 'package:bailingapp/message/Message.dart';
import 'package:bailingapp/communicate/Communicate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final _widgetItems = [Message(), Communicate(), WorkPlatform(), MineWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetItems[_selectedIndex], //选中不同的选项显示不同的界面
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
          BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text("工作台")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("个人中心"))
        ], //BottomNavigationBarItem 的 icon 用的是 Icon Widget实现的，这里是随便找的图标，先实现功能，后续在改成和 豆瓣电影 的一样
        currentIndex: _selectedIndex, //默认选中的 index
        fixedColor: Colors.black, //选中时颜色变为黑色
        type: BottomNavigationBarType.fixed, //类型为 fixed
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //刷新界面
    });
  }
}
