import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/mainMenu/components/favourite_list.dart';
import 'package:food_on_time/screens/mainMenu/components/item_list.dart';
import 'package:food_on_time/screens/mainMenu/components/search.dart';

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                  child: Container(
                    height: 45.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: Colors.grey[350],
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Search()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey[850],
                            ),
                          ),
                          Text(
                            "What are you craving?",
                            style: TextStyle(
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
                  child: Center(
                    child: Text(
                      "You have reached the end of the page.".toUpperCase(),
                      style: TextStyle(
                          color: kTextLightColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
