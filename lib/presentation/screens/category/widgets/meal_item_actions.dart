import 'package:flutter/material.dart';

class MealItemActions extends StatelessWidget {
  final Function addAction;
  final Function removeAction;
  final Function clearAction;
  final String count;
  const MealItemActions({
    this.addAction,
    this.clearAction,
    this.removeAction,
    this.count,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        actionIcon(
            Icon(
              Icons.remove_shopping_cart,
              color: Colors.black26,
            ),
            clearAction),
        SizedBox(
          width: 20,
        ),
        actionIcon(Icon(Icons.remove, color: Colors.black54), removeAction),
        SizedBox(
          width: 5,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12)),
          child: Text(
            count,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(fontSize: 15),
          ),
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 5,
        ),
        actionIcon(Icon(Icons.add, color: Colors.black54), addAction)
      ],
    );
  }

  Widget actionIcon(Icon icon, Function action) {
    return InkWell(
      onTap: action,
      child: icon,
    );
  }
}
