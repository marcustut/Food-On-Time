import 'package:flutter/material.dart';
import 'package:food_on_time/screens/mainMenu/components/item_card.dart';
import 'package:food_on_time/screens/review/review-screen.dart';
import 'package:food_on_time/screens/detail/detail-screen.dart';
import 'package:food_on_time/constant.dart';

class ItemList extends StatelessWidget {
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
                  'RECOMMENDATION',
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
                          child: Row(
                            children: <Widget>[
                              ItemCard(
                                title: "Burger",
                                address: "Kampus Utama, Jalan Genting Kelang",
                                imgUrl: "",
                                press: () {
                                  print("I am Card 1");
                                },
                              ),
                              ItemCard(
                                title: "Burger",
                                address: "McDonalds",
                                imgUrl: "",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ReviewScreen();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ItemCard(
                                title: "Burger",
                                address: "McDonalds",
                                imgUrl: "",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailScreen();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ItemCard(
                                title: "Burger",
                                address: "McDonalds",
                                imgUrl: "",
                                press: () {},
                              ),
                              ItemCard(
                                title: "Burger",
                                address: "McDonalds",
                                imgUrl: "",
                                press: () {},
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
