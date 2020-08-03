import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';

AppBar menuAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: CircleAvatar(
      radius: 30.0,
      backgroundImage: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Outdoors-man-portrait_%28cropped%29.jpg/1200px-Outdoors-man-portrait_%28cropped%29.jpg'),
    ),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.search, color: kTextLightColor), onPressed: null)
    ],
  );
}
