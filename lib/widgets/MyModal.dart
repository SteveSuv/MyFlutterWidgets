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

Widget myTitle({String title}) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Text(title ?? '提示',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );
}

Widget myOptions({List options}) {
  int length = options.length;
  if (length == 1) {
    return SizedBox(
        height: 60,
        width: 320,
        child: FlatButton(
            clipBehavior: Clip.hardEdge,
            highlightColor: MyColors.lightColor,
            onPressed: options[0]['onPressed'],
            child: Text(
              options[0]['text'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: MyColors.themeColor),
            )));
  } else if (length == 2) {
    return SizedBox(
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
                  onPressed: options[0]['onPressed'],
                  child: Text(
                    options[0]['text'],
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
                  onPressed: options[1]['onPressed'],
                  child: Text(
                    options[1]['text'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: MyColors.themeColor),
                  )),
            ),
          ],
        ));
  } else {
    throw 'options length can only be 1 or 2';
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
        child: Container(
          width: 320.0,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              myTitle(title: title),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Text(content, style: TextStyle(fontSize: 17)),
              ),
              MyDivider.horizontal,
              myOptions(options: [
                {
                  'text': '取消',
                  'onPressed': () {
                    Navigator.pop(context);
                  }
                },
                {
                  'text': '确定',
                  'onPressed': () {
                    Navigator.pop(context);
                  }
                },
              ])
            ],
          ),
        ),
      ),
    );
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
        child: Container(
          width: 320.0,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(content, style: TextStyle(fontSize: 17)),
              ),
              MyDivider.horizontal,
              myOptions(options: [
                {
                  'text': '我知道了',
                  'onPressed': () {
                    Navigator.pop(context);
                  }
                },
              ])
            ],
          ),
        ),
      ),
    );
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
        child: Container(
            width: width ?? 320,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: child),
      ),
    );
  }
}
