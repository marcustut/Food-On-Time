import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_on_time/screens/detail/components/alert_dialog.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Body extends StatefulWidget {
  final String storeTitle, address, imgPath;
  final double rating;

  const Body(
      {Key key, this.storeTitle, this.address, this.imgPath, this.rating})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _n = 0;
  double price = 15.90;
  double total_price = 0.00;

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
                  widget.imgPath,
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
            height: 440,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    padding: new EdgeInsets.fromLTRB(5.0, 0.0, 20.0, 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            widget.storeTitle,
                            style: new TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: <Widget>[
                            new Text(
                              "RM $price ",
                              style: new TextStyle(
                                  color: Colors.red, fontSize: 20),
                            ),
                          ])
                        ])),
                Container(
                    padding: new EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 0.0),
                    child: Row(children: <Widget>[
                      Flexible(
                        child: new Text(
                          "Address: ${widget.address}",
                          style:
                              new TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ])),
                Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Row(children: <Widget>[
                      RatingBar(
                        initialRating: widget.rating,
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
                    child: Row(children: <Widget>[
                  SizedBox(
                    width: 330.0,
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 35,
                      size: 8,
                      padding: 0,
                      selectedColor: Colors.yellow,
                      unselectedColor: Colors.cyan,
                      roundedEdges: Radius.circular(10),
                    ),
                  )
                ])),
                Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 15.0)),
                          Text(
                            'Left 65% to unlock the Deals',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ])),
                Container(
                  child: Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                    child: Container(
                        height: 1.0, width: 430.0, color: Colors.black),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "RM $total_price",
                        style: new TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.remove),
                                color: Colors.cyan,
                                highlightColor: Colors.lightGreen,
                                onPressed: () {
                                  setState(() {
                                    if (_n != 0) _n--;
                                    total_price = price * _n;
                                  });
                                  print(_n);
                                }),
                            Text(
                              "$_n",
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                            IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.cyan,
                                highlightColor: Colors.lightGreen,
                                onPressed: () {
                                  setState(() {
                                    _n++;
                                    total_price = price * _n;
                                  });
                                  print(_n);
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.deepOrange,
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text(
                          "Check Out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
