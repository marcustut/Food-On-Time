import 'package:flutter/material.dart';
import 'package:food_on_time/screens/mainMenu/components/item_card.dart';
import 'package:food_on_time/screens/review/review-screen.dart';
import 'package:food_on_time/screens/detail/detail-screen.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/mainMenu/models/item.dart';

class ItemList extends StatelessWidget {
  final String categoryTitle, jsonPath;

  const ItemList({Key key, this.categoryTitle, this.jsonPath})
      : super(key: key);

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
                        child: new FutureBuilder(
                            future: DefaultAssetBundle.of(context)
                                .loadString(jsonPath),
                            builder: (context, snapshot) {
                              List<Item> stores =
                                  Item.parseJson(snapshot.data.toString());

                              // if the json file is not empty
                              if (stores.isNotEmpty) {
                                // return a list of ItemCard widgets
                                List<ItemCard> storesToRender =
                                    new List<ItemCard>();
                                for (var store in stores) {
                                  storesToRender.add(new ItemCard(
                                    storeTitle: store.storeTitle,
                                    address: store.address,
                                    imgPath: store.imgPath,
                                    tags: store.tags,
                                    distance: store.distance,
                                    rating: store.rating,
                                    checkIns: store.checkIns,
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
                                  ));
                                }
                                return new Row(children: storesToRender);
                                // if json file is empty
                              } else {
                                // return a circle loading indicator
                                return new Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
