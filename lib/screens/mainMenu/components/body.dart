import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/mainMenu/components/favourite_list.dart';
import 'package:food_on_time/screens/mainMenu/components/item_list.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Text(
                  'Good Evening!',
                  style: TextStyle(
                      fontSize: 24,
                      color: kTextLightColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'How about a dinner out near you?',
                style: TextStyle(fontSize: 16, color: kTextLightColor),
              ),
            ],
          ),
        ),
        ItemList(
          categoryTitle: 'recommendations',
          jsonPath: 'assets/recommendations.json',
        ),
        FavouriteList(
          categoryTitle: "my favourite cuisines",
        ),
        ItemList(
          categoryTitle: 'near me',
          jsonPath: 'assets/nearme.json',
        ),
      ],
    ));
  }
}
