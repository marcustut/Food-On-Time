import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/trackOrder/components/map_page.dart';
import 'package:food_on_time/screens/trackOrder/components/app_bar.dart';

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: TrackAppBar(),
      body: MapPage(),
    );
  }
}
