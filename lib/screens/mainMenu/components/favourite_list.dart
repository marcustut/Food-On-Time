import 'package:flutter/material.dart';
import 'package:food_on_time/screens/mainMenu/components/favourite_card.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/review/review-screen.dart';

class FavouriteList extends StatelessWidget {
  final String categoryTitle;

  const FavouriteList({Key key, this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$categoryTitle'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      color: kTextLightColor,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          // FutureBuilder to load json file
                          child: Row(
                            children: <Widget>[
                              FavouriteCard(
                                cardTitle: "Fastfood",
                                cardIconSvg: "assets/icons/fast-food.svg",
                              ),
                              FavouriteCard(
                                cardTitle: "Sushi",
                                cardIconSvg: "assets/icons/sushi.svg",
                              ),
                              FavouriteCard(
                                cardTitle: "Pizza",
                                cardIconSvg: 'assets/icons/pizza.svg',
                              ),
                              FavouriteCard(
                                cardTitle: "Western",
                                cardIconSvg: 'assets/icons/steak.svg',
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
