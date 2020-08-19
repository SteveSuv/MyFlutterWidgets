import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MyTabHeader extends StatelessWidget {
  List<Widget> tabViews;
  List<Tab> tabs;
  MyTabHeader({@required this.tabs, @required this.tabViews});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, kToolbarHeight),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0xffcccccc)))),
                padding: EdgeInsets.only(top: statusBarHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black38,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      // controller: controll,
                      tabs: tabs,
                    ),
                    IconButton(icon: Icon(Feather.search), onPressed: () {})
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: tabViews,
            )));
  }
}

// example
/*
MyTabHeader(
  tabs: [
        Tab(text: '首页'),
        Tab(text: '火热'),
        Tab(text: '实时'),
      ], 
tabViews: [
        Icon(Icons.directions_car),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
      ])
*/
