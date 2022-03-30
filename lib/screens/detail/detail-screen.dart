import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/models/item.dart';
import 'package:food_on_time/screens/detail/components/app_bar.dart';
import 'package:food_on_time/screens/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBars(),
      body: Body(item: item),
    );
  }
}
