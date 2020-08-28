import 'package:MyWidgets/widgets/MyColors.dart';
import 'package:flutter/material.dart';

class MyDivider {
  static horizontal({double length}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: length ?? 1, color: MyColors.lightColor))),
    );
  }

  static vertical({double length}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right:
                  BorderSide(width: length ?? 1, color: MyColors.lightColor))),
    );
  }
}
