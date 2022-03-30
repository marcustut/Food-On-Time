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
              bodyText1: TextStyle(color: kSecondaryColor),
              bodyText2: TextStyle(color: kSecondaryColor),
            )),
        home: GetStarted(),
      ),
    );
  }
}
