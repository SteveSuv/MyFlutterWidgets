import 'package:MyWidgets/widgets/MyColors.dart';
import 'package:MyWidgets/widgets/MyDivider.dart';
import 'package:MyWidgets/widgets/MyFuncs.dart';
import 'package:flutter/material.dart';

// 还未考虑字数换行问题

class MyModal {
  BuildContext context;
  MyModal({@required this.context});

// Alert
  showAlert(String content) {
    showDialog(
      context: context,
      child: AlertDialog(
        content: content,
      ),
    );
  }

// Confirm
  showConfirm(String content, {String title}) {
    showDialog(
      context: context,
      child: ConfirmDialog(
        title: title,
        content: content,
      ),
    );
  }

// 自定义Modal
  showModal({@required Widget child, double width, double height}) {
    showDialog(
      context: context,
      child: ModalDialog(
        child: child,
        width: width,
        height: height,
      ),
    );
  }
}

class ConfirmDialog extends Dialog {
  final String title;
  final String content;

  ConfirmDialog({this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 320.0,
            height: 180.0,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 119,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title ?? '提示',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          Text(content, style: TextStyle(fontSize: 17))
                        ],
                      )),
                  MyDivider.horizontal,
                  SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 159.5,
                            height: 60,
                            child: FlatButton(
                                clipBehavior: Clip.hardEdge,
                                highlightColor: MyColors.lightColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  '取消',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                          MyDivider.vertical,
                          SizedBox(
                            width: 159.5,
                            height: 60,
                            child: FlatButton(
                                clipBehavior: Clip.hardEdge,
                                highlightColor: MyColors.lightColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  '确定',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: MyColors.themeColor),
                                )),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}

class AlertDialog extends Dialog {
  final String content;

  AlertDialog({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 320.0,
            height: 150.0,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 89,
                      child: Center(
                        child: Text(content, style: TextStyle(fontSize: 17)),
                      )),
                  MyDivider.horizontal,
                  SizedBox(
                      height: 60,
                      width: 320,
                      child: FlatButton(
                          clipBehavior: Clip.hardEdge,
                          highlightColor: MyColors.lightColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '我知道了',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: MyColors.themeColor),
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}

class ModalDialog extends Dialog {
  final Widget child;
  final double width;
  final double height;

  ModalDialog({@required this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: width ?? 320,
            height: height ?? 180,
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: child),
          ),
        ));
  }
}
