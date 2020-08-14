import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/underConstruction/underConstruction.dart';

class Restaurant {
  final String storeTitle, address, imgPath, tags;
  final double distance, rating;
  final int checkIns;

  const Restaurant({
    this.storeTitle,
    this.address,
    this.imgPath,
    this.tags,
    this.distance,
    this.rating,
    this.checkIns,
  });
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
    "Fast Food",
    "Cafe",
    "Cheese",
    "Chicken Rice",
    "Chinese",
    "Western",
    "Burgers",
    "Noodles",
    "Halal",
    "Non-Halal",
    "Coffee",
    "Convenience Store",
    "Dim Sum",
    "Dessert",
    "Durian",
    "Fish & Seafood",
    "Fruits",
    "Fusion",
    "Healthy"
  ];

  final popularCuisines = [
    "Halal",
    "Non-Halal",
    "Fast Food",
    "Fried Chicken",
    "Burgers",
    "Noodles",
    "Sushi",
    "Western"
  ];

  FlatButton generateFlatButton(BuildContext context, String popularCuisines) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white12,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnderConstruction(),
          ),
        );
      },
      child: Text(
        popularCuisines,
        style: TextStyle(color: kTextLightColor),
      ),
    );
  }

  Future<List<Restaurant>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return new Restaurant(
          storeTitle: "Domino's",
          address:
              "138, Jalan Jejaka, Maluri, 55100 Kuala Lumpur, Wilayah Persekutuan.",
          checkIns: 125,
          distance: 5.3,
          imgPath: "assets/images/dominos.jpg",
          rating: 4.3,
          tags: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                  onItemFound: (Restaurant restaurant, int index) {
                    // return ListTile(
                    //   title: Text(
                    //     restaurant.storeTitle,
                    //     style: TextStyle(color: kTextColor),
                    //   ),
                    //   subtitle: Text(
                    //     restaurant.address,
                    //     style: TextStyle(color: kTextColor),
                    //   ),
                    // );
                    return Container(
                      padding: EdgeInsets.only(top: 10.0),
                      height: 110.0,
                      width: double.maxFinite,
                      child: Card(
                        color: Colors.white12,
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 100.0,
                                  width: 125.0,
                                  child: Image.asset(
                                    restaurant.imgPath,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 132.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant.storeTitle,
                                        style: TextStyle(
                                          color: kTextLightColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                      Text(
                                        restaurant.address,
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontSize: 13.0),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15.0,
                                            ),
                                            Text(
                                              "${restaurant.rating}  ",
                                              style: TextStyle(
                                                  color: kTextLightColor),
                                            ),
                                            Icon(
                                              Icons.near_me,
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                            Text(
                                              "${restaurant.distance} km  ",
                                              style: TextStyle(
                                                  color: kTextLightColor),
                                            ),
                                            Icon(
                                              Icons.motorcycle,
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                            Text(
                                              " RM${15.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: kTextLightColor),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
                                    children: popularCuisines
                                        .map((popularCuisine) =>
                                            generateFlatButton(
                                                context, popularCuisine))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                      Container(
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
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: allCusines.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UnderConstruction(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  height: 50.0,
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.white12,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
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
                          ),
                        ),
                      ),
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
