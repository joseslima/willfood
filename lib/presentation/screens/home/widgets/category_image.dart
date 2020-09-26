import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final Color secondGradientColor;
  final BorderRadiusGeometry borderRadius;
  final double gradientOpacity;

  const CategoryImage({
    this.url,
    this.height,
    this.secondGradientColor,
    this.borderRadius,
    this.width,
    this.gradientOpacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: Container(
              height: height != null ? height : double.infinity,
              width: width != null ? width : double.infinity,
              decoration: BoxDecoration(borderRadius: borderRadius),
              child: CachedNetworkImage(
                fadeOutCurve: Curves.easeIn,
                fit: BoxFit.cover,
                imageUrl: url,
                // placeholder: (context, url) =>
                //     Image.asset("assets/images/image_placeholder_500x300.png"),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
              // child: url != null
              //     ? CachedNetworkImage(
              //         fadeOutCurve: Curves.easeIn,
              //         fit: BoxFit.cover,
              //         imageUrl: url,
              //         placeholder: (context, url) => Image.asset("assets/images/image_placeholder_500x300.png"),
              //         errorWidget: (context, url, error) => Icon(Icons.error),
              //       )
              //     : Image.asset("assets/images/image_placeholder_500x300.png"),
              ),
        ),
        Opacity(
          opacity: gradientOpacity ?? 0,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  secondGradientColor,
                ],
              ),
              borderRadius: borderRadius,
            ),
          ),
        )
      ],
    );
  }
}
