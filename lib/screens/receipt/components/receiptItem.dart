import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/loginRegister/loginSheet.dart';
import 'package:food_on_time/screens/mainMenu/mainMenu.dart';

class ReceiptItem extends StatelessWidget {
  final String itemName, amount;

  const ReceiptItem({Key key, this.itemName, this.amount}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Text(
                  itemName,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Text(
                  "RM" + amount,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
