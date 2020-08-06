import 'package:flutter/material.dart';
import 'package:food_on_time/screens/get_started/components/splash_screen.dart';
import 'package:food_on_time/screens/get_started/components/body.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MySplashScreen(),
    );
  }
}
