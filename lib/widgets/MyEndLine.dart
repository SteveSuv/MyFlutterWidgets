import 'package:flutter/material.dart';

class MyEndLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('- 已经到底了 -',
              style: TextStyle(color: Color(0xffcccccc), fontSize: 13))
        ]));
  }
}
