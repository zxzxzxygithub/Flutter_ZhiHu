import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zhihu/campus/campus_page.dart';
import 'package:flutter_zhihu/idea/Idea_page.dart';
import 'package:flutter_zhihu/me/me_page.dart';
import 'package:flutter_zhihu/message/message_page.dart';
import 'package:flutter_zhihu/myhome/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _tabIndex = 1;
  bool isFinishSetup = false;
  List<Icon> _tabImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.grey,),
    Icon(Icons.touch_app, size: 25.0, color: Colors.grey,),
    Icon(Icons.school, size: 25.0, color: Colors.grey,),
    Icon(Icons.notifications, size: 25.0, color: Colors.grey,),
    Icon(Icons.person, size: 25.0, color: Colors.grey,),
  ];
  List<Icon> _tabSelectedImages = [
    Icon(Icons.view_list, size: 25.0, color: Colors.blue,),
    Icon(Icons.touch_app, size: 25.0, color: Colors.blue,),
    Icon(Icons.school, size: 25.0, color: Colors.blue,),
    Icon(Icons.notifications, size: 25.0, color: Colors.blue,),
    Icon(Icons.person, size: 25.0, color: Colors.blue,),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          MyHomePage(),
          IdeaPage(),
          CompusPage(),
          MessagePage(),
          MePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('首页1')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('想法1')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('大学1')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('消息1')),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text('我1')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Icon getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
