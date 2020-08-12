import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:food_on_time/constant.dart';

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Search extends StatelessWidget {
  final allCusines = [
    "Asian",
    "Baked Goods",
    "Bakery",
    "BBQ",
    "Beverages",
    "Breakfast",
    "Bubble Tea",
    // "Fast Food",
    // "Cafe",
    // "Cheese",
    // "Chicken Rice",
    // "Chinese",
    // "Western",
    // "Burgers",
    // "Noodles",
    // "Halal",
    // "Non-Halal",
    // "Coffee",
    // "Convenience Store",
    // "Dim Sum",
    // "Dessert",
    // "Durian",
    // "Fish & Seafood",
    // "Fruits",
    // "Fusion",
    // "Healthy"
  ];

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SearchBar(
                  onSearch: search,
                  onItemFound: (Post post, int index) {
                    return ListTile(
                      title: Text(
                        post.title,
                        style: TextStyle(color: kTextColor),
                      ),
                      subtitle: Text(
                        post.description,
                        style: TextStyle(color: kTextColor),
                      ),
                    );
                  },
                  searchBarStyle: SearchBarStyle(
                      padding: EdgeInsets.only(left: 15.0),
                      borderRadius: BorderRadius.circular(6.0)),
                  textStyle: TextStyle(color: kTextLightColor),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  hintText: "What are you craving?",
                  hintStyle: TextStyle(
                    color: Colors.white38,
                  ),
                  cancellationWidget: Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  placeHolder: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Popular Cuisines",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: kTextLightColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Wrap(
                                    spacing: 10.0,
                                    children: <Widget>[
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Halal",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Non-Halal",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Fast Food",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Fried Chicken",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Burgers",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Noodles",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Sushi",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: Colors.white12,
                                        onPressed: () {},
                                        child: Text(
                                          "Western",
                                          style:
                                              TextStyle(color: kTextLightColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "All Cuisines",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: kTextLightColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Flexible(
                                      child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: allCusines.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          print("I am tapped.");
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          height: 50.0,
                                          child: Card(
                                            elevation: 0,
                                            color: Colors.white12,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    allCusines[index],
                                                    style: TextStyle(
                                                      color: kTextLightColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
