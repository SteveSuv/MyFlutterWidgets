import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class MyImageGrid extends StatelessWidget {
  final List<String> urls;
  final Function onTap;
  MyImageGrid({@required this.urls, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: urls.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: onTap,
              child: ExtendedImage.network(
                urls[index],
                height: 50,
                fit: BoxFit.cover,
                cache: true,
                mode: ExtendedImageMode.none,
              ));
        },
      ),
    );
  }
}
