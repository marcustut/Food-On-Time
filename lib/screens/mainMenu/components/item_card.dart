import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';

class ItemCard extends StatelessWidget {
  final String storeTitle, address, imgUrl, tags;
  final double distance, rating;
  final int checkIns;
  final Function press;

  const ItemCard(
      {Key key,
      this.storeTitle,
      this.address,
      this.imgUrl,
      this.press,
      this.tags,
      this.distance,
      this.checkIns,
      this.rating})
      : super(key: key);

  Row storeRating(double rating) {
    if (rating < 1 || rating > 5) assert(false);

    Row storeRating = Row(children: <Widget>[]);

    for (int i = 0; i < rating.floor(); i++) {
      storeRating.children.add(
        Icon(
          Icons.star,
          size: 15.0,
          color: Colors.amber,
        ),
      );
    }

    for (int i = 5; i > rating.floor(); i--) {
      storeRating.children.add(
        Icon(
          Icons.star,
          size: 15.0,
          color: Colors.grey.shade300,
        ),
      );
    }

    return storeRating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 263.0,
      margin: EdgeInsets.only(bottom: 15, top: 15, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 20,
              color: Color(0xFF000000).withOpacity(0.32),
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 300.0,
                      height: 125.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imgUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    storeTitle,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    address,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 120.0,
                            height: 10.0,
                            child: storeRating(rating))
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    '$tags'.toUpperCase(),
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '$checkIns check-ins',
                        style: TextStyle(color: kTextColor),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.near_me,
                            size: 13,
                          ),
                          Text(
                            ' $distance km',
                            style: TextStyle(color: kTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
