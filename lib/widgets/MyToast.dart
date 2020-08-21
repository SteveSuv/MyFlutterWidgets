import 'package:MyWidgets/widgets/MyFuncs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast {
  BuildContext context;
  MyToast({@required this.context});

  showToast(String content) {
    FToast fToast = FToast(context);
    fToast.showToast(
      child: ToastDialog(content: content),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  showLoading(String content) {
    showDialog(
      context: context,
      child: LoadingDialog(content: content),
      barrierColor: Colors.white.withOpacity(0),
    );
  }

  stopLoading() {
    Navigator.pop(context);
  }

  showSuccess(String content) {
    showDialog(
      context: context,
      child: SuccessDialog(content: content),
      barrierColor: Colors.white.withOpacity(0),
    );
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  showFail(String content) {
    showDialog(
      context: context,
      child: FailDialog(content: content),
      barrierColor: Colors.white.withOpacity(0),
    );
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }
}

class ToastDialog extends StatelessWidget {
  final String content;
  ToastDialog({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(content),
        ],
      ),
    );
  }
}

class LoadingDialog extends Dialog {
  final String content;
  LoadingDialog({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        shadowColor: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.7),
                  shape: MyFuncs.radius(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 50,
                      child: Center(
                        child: SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 1,
                            )),
                      )),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        // )
        );
  }
}

class SuccessDialog extends Dialog {
  final String content;

  SuccessDialog({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        shadowColor: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.7),
                  shape: MyFuncs.radius(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                        child: Icon(
                      SimpleLineIcons.check,
                      color: Colors.white,
                      size: 25,
                    )),
                  ),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class FailDialog extends Dialog {
  final String content;

  FailDialog({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        shadowColor: Colors.transparent,
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.7),
                  shape: MyFuncs.radius(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: Center(
                        child: Icon(
                      SimpleLineIcons.clock,
                      color: Colors.white,
                      size: 25,
                    )),
                  ),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
