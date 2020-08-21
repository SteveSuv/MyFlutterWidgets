import 'package:MyWidgets/widgets/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyRefresh extends StatelessWidget {
  final Widget child;
  MyRefresh({@required this.child});

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(
          color: MyColors.themeColor,
        ),
        footer: RefreshFooter(),
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child);
  }
}

class RefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus mode) {
        Widget body;
        if (mode == RefreshStatus.idle) {
          body = Column(
            children: <Widget>[
              Icon(Feather.arrow_down, size: 20),
              SizedBox(
                height: 3,
              ),
              Text("下拉刷新")
            ],
          );
        } else if (mode == RefreshStatus.refreshing) {
          body = CupertinoActivityIndicator();
        } else if (mode == RefreshStatus.failed) {
          body = Text("刷新失败");
        } else if (mode == RefreshStatus.canRefresh) {
          body = Column(
            children: <Widget>[
              Icon(Feather.arrow_up, size: 20),
              SizedBox(
                height: 3,
              ),
              Text("松手刷新")
            ],
          );
        } else {
          body = Text("没有数据");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}

class RefreshFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Column(
            children: <Widget>[
              Icon(Feather.arrow_up, size: 20),
              SizedBox(
                height: 3,
              ),
              Text("上拉加载")
            ],
          );
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败");
        } else if (mode == LoadStatus.canLoading) {
          body = Column(
            children: <Widget>[
              Icon(Feather.arrow_down, size: 20),
              SizedBox(
                height: 3,
              ),
              Text("松手加载")
            ],
          );
        } else {
          body = Text("没有数据");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
