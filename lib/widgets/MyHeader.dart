import 'package:MyWidgets/widgets/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MyHeader extends StatelessWidget {
  final String title;
  MyHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return PreferredSize(
      preferredSize: Size(double.infinity, kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: MyColors.lightColor))),
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Feather.arrow_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(Feather.more_horizontal),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
