import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/get_started/components/splash_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.72),
                BlendMode.srcOver, //Make background image darker
              ),
              image: NetworkImage(
                  'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=1155&h=1528'),
              fit: BoxFit.cover),
        ),

        child: Padding(
          padding:
              EdgeInsets.only(left: 30.0, right: 30.0, top: 35.0, bottom: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Food On Time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Icon(Icons.donut_small,
                          size: 15.0, color: kSecondaryColor), //Donut logo
                    ),
                  ),
                ],
              ),
              Spacer(flex: 9), //Put space between widgets

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tasty,\naffordable,\nchef-made\nfood delivered',
                  style: TextStyle(
                    fontSize: 45,
                    color: kTextLightColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Spacer(flex: 1),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.star,
                        size: 28.0, color: kTextLightColor), //Star icon
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center, //Align text to the star icon
                        child: Text(
                          'Over 2 million',
                          style: TextStyle(
                            fontSize: 15,
                            color: kTextLightColor,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'halal-friendly meals cooked and served',
                          style: TextStyle(
                            fontSize: 13,
                            color: kTextLightColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Spacer(flex: 1),

              Container(
                width: 400.0,
                height: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: kSecondaryColor, // This is button Color
                  hoverColor: kPrimaryColor,
                  hoverElevation: 5,
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ), //This is font color
                ),
              ),

              Spacer(flex: 1),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Malaysia',
                    style: TextStyle(
                      fontSize: 13,
                      color: kTextLightColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' - currently available only in West Malaysia',
                    style: TextStyle(
                      fontSize: 13,
                      color: kTextLightColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
