import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/cart/cartScreen.dart';
import 'package:food_on_time/screens/underConstruction/underConstruction.dart';

AppBar menuAppBar(BuildContext context) {
  return AppBar(
    elevation: 10,
    leading: CircleAvatar(
      radius: 15,
      child: ClipOval(
        child: Image.asset(
          'assets/avatars/KaiYang.jpg',
          width: 35,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: Colors.transparent,
    ),
    title: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            " Deliver to",
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
          ),
          Container(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Marcus",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: kTextLightColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
      )
    ],
  );
}
