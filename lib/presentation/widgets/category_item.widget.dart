import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willfood/core/domain/service/category/dto/category.dto.dart';
import 'package:willfood/core/state/category/category.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:willfood/presentation/widgets/category_image.widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key key,
      @required this.category,
      @required this.position,
      this.backAction = false,
      this.onTap,
      this.padding,
      this.height})
      : super(key: key);

  final int position;
  final Category category;
  final Function onTap;
  final EdgeInsets padding;
  final double height;
  final bool backAction;

  @override
  Widget build(BuildContext context) {
    var widgetPadding = padding ?? EdgeInsets.all(20);
    return Padding(
        padding: widgetPadding,
        child: InkWell(
          onTap: this.onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: Stack(
              children: [
                Hero(
                  tag: category.idCategory,
                  child: CategoryImage(
                    secondGradientColor: Colors.black87,
                    height: height ?? 180.0,
                    url: category.strCategoryThumb,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Text(
                          category.strCategory,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                this.backAction ?
                Positioned(
                  top: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Material(
                      elevation: 3,
                      shape: CircleBorder(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white12, shape: BoxShape.circle),
                        width: 35,
                        height: 35,
                        child: Icon(Icons.arrow_back, color: Colors.black45),
                      ),
                    ),
                  ),
                ): Container()
              ],
            ),
          ),
        ));
  }
}
