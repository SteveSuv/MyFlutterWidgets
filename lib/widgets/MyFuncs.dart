import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class $ {
  static const a = 2;
  static ShapeBorder radius(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }
}
