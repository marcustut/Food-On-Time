import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/detail/components/app_bar.dart';
import 'package:food_on_time/screens/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  final String storeTitle, address, imgPath;
  final double rating;

  const DetailScreen(
      {Key key, this.storeTitle, this.address, this.imgPath, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBars(),
      body: Body(
        address: this.address,
        imgPath: this.imgPath,
        storeTitle: this.storeTitle,
        rating: this.rating,
      ),
    );
  }
}
