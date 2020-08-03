import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/mainMenu/components/item_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Good Evening!',
          style: TextStyle(fontSize: 24, color: kTextLightColor),
        ),
        Text(
          'Any idea what to eat today?',
          style: TextStyle(fontSize: 16, color: kTextLightColor),
        ),
        ItemList(),
      ],
    ));
  }
}
