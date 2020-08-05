import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';

AppBar menuAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: CircleAvatar(
      radius: 15,
      child: ClipOval(
        child: Image.asset(
          'assets/avatars/KaiYang.jpg',
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: Colors.transparent,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.search,
          color: kTextLightColor,
        ),
        onPressed: () {},
      )
    ],
  );
}
