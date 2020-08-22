import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:scoped_model/scoped_model.dart';

class MyModel extends Model {
  int currentIndex = 0;

  setIndex(index) {
    currentIndex = index;
  }

  static of(BuildContext context) => ScopedModel.of<MyModel>(context);
}

class MyImageView extends StatelessWidget {
  final List urls;
  final int nowIndex;
  MyImageView({@required this.urls, this.nowIndex = 0});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyModel>(
        model: MyModel(),
        child: ScopedModelDescendant<MyModel>(
            builder: (context, child, model) =>
                ExtendedImageGesturePageView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    String nowUrl = urls[index];
                    Widget image = ExtendedImage.network(
                      nowUrl,
                      fit: BoxFit.contain,
                      mode: ExtendedImageMode.gesture,
                    );
                    image = Container(
                      child: image,
                      padding: EdgeInsets.all(5.0),
                    );
                    if (index == model.currentIndex) {
                      return Hero(
                        tag: nowUrl + index.toString(),
                        child: image,
                      );
                    } else {
                      return image;
                    }
                  },
                  itemCount: urls.length,
                  onPageChanged: (int index) {
                    model.setIndex(index);
                  },
                  controller: PageController(
                    initialPage: model.currentIndex,
                  ),
                  scrollDirection: Axis.horizontal,
                )));
  }
}
