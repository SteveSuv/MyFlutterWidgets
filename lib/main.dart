import 'package:MyWidgets/widgets/MyImageGrid.dart';
import 'package:MyWidgets/widgets/MyModal.dart';
import 'package:MyWidgets/widgets/MyRefresh.dart';
import 'package:MyWidgets/widgets/MyRequest.dart';
import 'package:MyWidgets/widgets/MyToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
// import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(child: Text('hello')));
  }
}
