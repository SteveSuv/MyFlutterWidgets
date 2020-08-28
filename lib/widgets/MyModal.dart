import 'package:MyWidgets/widgets/MyColors.dart';
import 'package:MyWidgets/widgets/MyDivider.dart';
import 'package:MyWidgets/widgets/MyFuncs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

// menu
  showMenu(List<Map> menu) {
    showDialog(
      context: context,
      child: MenuDialog(menu: menu),
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

//android actionSheet
  showAndroidActionSheet(
      {@required List<Map> actions, String title, String message}) {
    List<Widget> myActions(context) {
      return actions.map((item) {
        return Column(
          children: [
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                    clipBehavior: Clip.hardEdge,
                    highlightColor: MyColors.lightColor,
                    onPressed: item["onPressed"],
                    child: Text(
                      item["text"],
                      style: TextStyle(
                        fontSize: 16,
                        color: item["color"] ?? Colors.black,
                      ),
                    ))),
            MyDivider.horizontal()
          ],
        );
      }).toList();
    }

    Widget cancelBtn() {
      return SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: FlatButton(
              clipBehavior: Clip.hardEdge,
              highlightColor: MyColors.lightColor,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '取消',
                style: TextStyle(
                  fontSize: 16,
                ),
              )));
    }

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    title != null
                        ? Padding(
                            padding: message != null
                                ? EdgeInsets.only(top: 15)
                                : EdgeInsets.all(15),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                        : SizedBox(height: 0),
                    message != null
                        ? Padding(
                            padding: EdgeInsets.all(10), child: Text(message))
                        : SizedBox(height: 0),
                    MyDivider.horizontal(),
                    ...myActions(context),
                    MyDivider.horizontal(length: 10),
                    cancelBtn()
                  ]));
        });
  }

//IOS actionSheet
  showIosActionSheet(
      {@required List<Map> actions, String title, String message}) {
    List<Widget> myActions() {
      return actions.map((item) {
        return CupertinoActionSheetAction(
          child: Text(item["text"]),
          onPressed: item["onPressed"],
          isDefaultAction: true,
        );
      }).toList();
    }

    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
              title: Text(title ?? '提示'),
              message: Text(message ?? '是否要删除当前项？'),
              cancelButton: CupertinoActionSheetAction(
                child: Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: myActions());
        });
  }

//自定义 actionSheet
  showActionSheet({@required child}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: child);
        });
  }
}

Widget myTitle({String title}) {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Text(title ?? '提示',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  );
}

Widget myOptions({List options}) {
  int length = options.length;
  if (length == 1) {
    return SizedBox(
        height: 50,
        width: 300,
        child: FlatButton(
            clipBehavior: Clip.hardEdge,
            highlightColor: MyColors.lightColor,
            onPressed: options[0]['onPressed'],
            child: Text(
              options[0]['text'],
              style: TextStyle(fontSize: 14, color: MyColors.themeColor),
            )));
  } else if (length == 2) {
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 149.5,
              height: 50,
              child: FlatButton(
                  clipBehavior: Clip.hardEdge,
                  highlightColor: MyColors.lightColor,
                  onPressed: options[0]['onPressed'],
                  child: Text(
                    options[0]['text'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )),
            ),
            MyDivider.vertical(),
            SizedBox(
              width: 149.5,
              height: 50,
              child: FlatButton(
                  clipBehavior: Clip.hardEdge,
                  highlightColor: MyColors.lightColor,
                  onPressed: options[1]['onPressed'],
                  child: Text(
                    options[1]['text'],
                    style: TextStyle(fontSize: 14, color: MyColors.themeColor),
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
          width: 300.0,
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
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
                child: Text(content, style: TextStyle(fontSize: 14)),
              ),
              MyDivider.horizontal(),
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
          width: 300.0,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Text(content, style: TextStyle(fontSize: 14)),
              ),
              MyDivider.horizontal(),
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

class MenuDialog extends Dialog {
  final List menu;

  MenuDialog({@required this.menu});

  List<Widget> myMenu(context) {
    return menu.map((item) {
      return Column(
        children: [
          SizedBox(
              height: 50,
              width: 300,
              child: FlatButton(
                  clipBehavior: Clip.hardEdge,
                  highlightColor: MyColors.lightColor,
                  onPressed: item["onPressed"],
                  child: Text(
                    item["text"],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ))),
          MyDivider.horizontal()
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 300.0,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: myMenu(context)),
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
            width: width ?? 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: child ?? Text('Hello')),
      ),
    );
  }
}
