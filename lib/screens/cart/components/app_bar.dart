import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';

class AppBars extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(50); // set height of your choice
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: new Text('Cart'),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
