import 'package:flutter/material.dart';
import 'package:food_on_time/screens/review/components/rating_bar.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // Rate Your Meals
            Container(
              child: Row(children: <Widget>[
                new Text(
                  "Rate Your Meals :",
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                )
              ]),
            ),
            //Rating Bar
            Container(
              child: Row(children: <Widget>[RatingBar()]),
            ),
            //Meals Multiple Selection
            Container(
              decoration: new BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: MultiSelect(
                  autovalidate: false,
                  titleText: "Enjoy your Meal ?",
                  validator: (value) {
                    if (value == null) {
                      return 'Please select one or more option(s)';
                    }
                  },
                  errorText: 'Please select one or more option(s)',
                  dataSource: [
                    {
                      "display": "Delicious",
                      "value": 1,
                    },
                    {
                      "display": "Clean",
                      "value": 2,
                    },
                    {
                      "display": "Dump",
                      "value": 3,
                    },
                    {
                      "display": "Moderate",
                      "value": 4,
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                  filterable: true,
                  required: true,
                  value: null,
                  onSaved: (value) {
                    print('The value is $value');
                  }),
            ),
            // Line
            Container(
              child: Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                child:
                    Container(height: 1.0, width: 430.0, color: Colors.white),
              ),
            ),
            //Rate The Delivery
            Container(
              child: Row(children: <Widget>[
                new Text(
                  "Rate The Delivery :",
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                )
              ]),
            ),
            // Deliver Rating Bar
            Container(
              child: Row(children: <Widget>[RatingBar()]),
            ),
            //Delivery Multiple Selection
            Container(
              decoration: new BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: MultiSelect(
                  autovalidate: false,
                  titleText: "How's the Delivery ?",
                  validator: (value) {
                    if (value == null) {
                      return 'Please select one or more option(s)';
                    }
                  },
                  errorText: 'Please select one or more option(s)',
                  dataSource: [
                    {
                      "display": "Fast",
                      "value": 1,
                    },
                    {
                      "display": "Polite",
                      "value": 2,
                    },
                    {
                      "display": "Rude",
                      "value": 3,
                    },
                    {
                      "display": "Slow",
                      "value": 4,
                    },
                    {
                      "display": "Troublesome",
                      "value": 5,
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                  filterable: true,
                  required: true,
                  value: null,
                  onSaved: (value) {
                    print('The value is $value');
                  }),
            ),
            // Line
            Container(
              child: Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                child:
                    Container(height: 1.0, width: 430.0, color: Colors.white),
              ),
            ),
            //Submit Button
            Container(
              padding: EdgeInsets.fromLTRB(250, 0, 0, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(children: <Widget>[
                  ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                title: new Text("Review"),
                                content:
                                    new Text("Thank You! For your review."),
                              ));
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.yellow),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(color: Colors.black)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(10, 10, 10, 10)),
                      splashFactory: InkSplash.splashFactory,
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
