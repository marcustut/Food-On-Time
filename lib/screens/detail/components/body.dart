import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_on_time/constant.dart';
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
  int _n = 1;
  double price = 15.9;
  double totalPrice = 0.0;

  void setInitialTotalPrice() {
    setState(() {
      totalPrice = _n * price;
    });
  }

  @override
  void initState() {
    super.initState();
    setInitialTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    final String information = "1 X Cheese Burger \n"
        "1 X French Fries \n"
        "1 X Soft Drink \n"
        "1 X Cheezy Wedges \n"
        "1 X Chicken Nugget \n";

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
            alignment: Alignment.center,
            width: double.infinity,
            height: size.height * 0.3,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.imgPath,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: 10,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          Container(
            padding: new EdgeInsets.only(left: 20.0, top: 30.0),
            width: double.infinity,
            height: size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
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
                              "RM ${price.toStringAsFixed(2)} ",
                              style: new TextStyle(
                                  color: Colors.red, fontSize: 20),
                            ),
                          ])
                        ])),
                Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
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
                    padding: new EdgeInsets.only(top: 10.0),
                    child: Row(children: <Widget>[
                      RatingBar(
                        initialRating: widget.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: size.width * 0.05,
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
                    padding: new EdgeInsets.only(top: 30.0),
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
                    padding: new EdgeInsets.only(top: 5.0),
                    child: Row(children: <Widget>[
                      new Text(
                        information,
                        style: new TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ])),
                Container(
                    child: Row(children: <Widget>[
                  SizedBox(
                    width: size.width * 0.9,
                    child: StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 35,
                      size: size.width * 0.02,
                      padding: 0,
                      selectedColor: Colors.deepOrange,
                      unselectedColor: Colors.deepOrange.shade100,
                      roundedEdges: Radius.circular(5),
                    ),
                  )
                ])),
                Container(
                    padding: new EdgeInsets.only(top: 15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '65% left to unlock new Deals',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              color: kTextColor,
                              fontSize: 12,
                            ),
                          ),
                        ])),
                Container(
                  child: Padding(
                    padding: new EdgeInsets.only(top: 13.0, right: 20.0),
                    child: Container(
                        height: 1.0,
                        width: size.width * 0.95,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "RM ${totalPrice.toStringAsFixed(2)}",
                        style: new TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
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
                                    totalPrice = price * _n;
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
                                    totalPrice = price * _n;
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
                  padding: new EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
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
        ],
      ),
    );
  }
}
