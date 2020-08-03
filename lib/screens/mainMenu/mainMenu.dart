import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: menuAppBar(context),
      body: Body(),
    );
  }
}
