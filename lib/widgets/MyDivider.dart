import 'package:MyWidgets/widgets/MyColors.dart';
import 'package:flutter/material.dart';

class MyDivider {
  static Container horizontal = Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1, color: MyColors.lightColor))),
  );

  static Container vertical = Container(
    decoration: BoxDecoration(
        border:
            Border(right: BorderSide(width: 1, color: MyColors.lightColor))),
  );
}
