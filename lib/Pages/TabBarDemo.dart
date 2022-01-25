import 'package:flutter/material.dart';
import 'package:new_drc_project/BottomNavPages/Bottom1.dart';
import 'package:new_drc_project/BottomNavPages/Bottom2.dart';
import 'package:new_drc_project/BottomNavPages/Bottom3.dart';
import 'package:new_drc_project/BottomNavPages/Bottom4.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBarDemo"),
          bottom:  const TabBar( tabs: [
            Icon(Icons.home),
            Icon(Icons.video_call),
            Icon(Icons.chat),
            Icon(Icons.favorite)
          ],
            padding: EdgeInsets.all(5),
            unselectedLabelColor: Colors.white,
            labelColor: Colors.blueGrey,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))

            ),
            labelPadding: EdgeInsets.all(10),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: TabBarView(
          children:<Widget> [
            Bottom1(),
            Bottom2(),
            Bottom3(),
            Bottom4()
          ],
        ),
      ),
    );
  }
}
