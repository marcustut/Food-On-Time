import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/models/cart.dart';
import 'package:food_on_time/screens/getStarted/getStarted.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food On Time',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              headline2: TextStyle(
                color: kTextColor,
                fontSize: 25,
                fontFamily: 'SourceCodePro',
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
              ),
              bodyText1: TextStyle(color: kSecondaryColor),
              bodyText2: TextStyle(color: kTextLightColor),
              caption: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontFamily: 'SourceCodePro',
                  fontWeight: FontWeight.w600),
            )),
        home: GetStarted(),
      ),
    );
  }
}
