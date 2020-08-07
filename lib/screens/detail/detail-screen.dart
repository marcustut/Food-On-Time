import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/detail/components/app_bar.dart';
import 'package:food_on_time/screens/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBars(),
      body: Body(),
    );
  }
}