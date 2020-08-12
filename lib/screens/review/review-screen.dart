import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/review/components/app_bar.dart';
import 'package:food_on_time/screens/review/components/selected.dart';
class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBars(),
      body: Body(),
    );
  }
}
