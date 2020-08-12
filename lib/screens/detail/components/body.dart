import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Body extends StatelessWidget {
  final String storeTitle, address, imgPath;
  final double rating;

  const Body(
      {Key key, this.storeTitle, this.address, this.imgPath, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String information = "1 X Cheese Burger \n"
        "1 X French Fries \n"
        "1 X Soft Drink \n"
        "1 X Chicken Nugget \n";

    return SingleChildScrollView(
      child: new Container(
        child: Column(children: <Widget>[
          Container(
            padding: new EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
            alignment: Alignment.center,
            width: double.infinity,
            height: 180,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  this.imgPath,
                  fit: BoxFit.cover,
                );
              },
              itemCount: 10,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(children: <Widget>[
              Container(
                  padding: new EdgeInsets.fromLTRB(5.0, 0.0, 20.0, 0.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          this.storeTitle,
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(children: <Widget>[
                          new Text(
                            "RM 15.90 ",
                            style:
                                new TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ])
                      ])),
              Container(
                  padding: new EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 0.0),
                  child: Row(children: <Widget>[
                    Flexible(
                      child: new Text(
                        "Address: ${this.address}",
                        style: new TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ])),
              Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Row(children: <Widget>[
                    RatingBar(
                      initialRating: this.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ])),
              Container(
                  padding: new EdgeInsets.fromLTRB(5.0, 30.0, 0.0, 0.0),
                  child: Row(children: <Widget>[
                    new Text(
                      'Details :',
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
              Container(
                  padding: new EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                  child: Row(children: <Widget>[
                    new Text(
                      information,
                      style: new TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ])),
              Container(
                  padding: new EdgeInsets.fromLTRB(5.0, 25.0, 0.0, 0.0),
                  child: Row(children: <Widget>[
                    new Text(
                      'Requierment :',
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
              Container(
                  padding: new EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      color: Colors.pink,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Padding(padding: EdgeInsets.only(left: 15.0)),
                    new Text(
                      'Login / Register ',
                      style: new TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ])),
              Container(
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                child: Row(children: <Widget>[
                  Icon(
                    Icons.access_alarms,
                    color: Colors.pink,
                    size: 30.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Padding(padding: EdgeInsets.only(left: 15.0)),
                  new Text(
                    '10:00 AM - 12:00 AM',
                    style: new TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ]),
              ),
              Container(
                child: Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
                  child:
                      Container(height: 1.0, width: 430.0, color: Colors.black),
                ),
              ),
              Container(
                padding: new EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: Text(
                        "Total Amount :",
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    ),
                    Text("RM 15.90",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.yellowAccent[700])),
                    Padding(padding: EdgeInsets.only(left: 35.0)),
                    Container(
                      child: Row(children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),
                          color: Colors.deepOrange,
                          onPressed: () {},
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
