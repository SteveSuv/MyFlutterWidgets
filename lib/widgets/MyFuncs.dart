import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFuncs {
  static ShapeBorder radius(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }
}
