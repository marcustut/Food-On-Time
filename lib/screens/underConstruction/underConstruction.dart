import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/underConstruction/components/app_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class UnderConstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBars(),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/under-construction.svg',
            width: size.width * 0.4,
          ),
          Text(
            "Coming Soon".toUpperCase(),
            style: TextStyle(
              color: kTextLightColor,
              fontSize: size.width * 0.08,
              fontWeight: FontWeight.bold,
              letterSpacing: 5.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 15.0),
            child: Text(
              "this feature is still under development",
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Container(
            width: size.width * 0.63,
            child: StepProgressIndicator(
              totalSteps: 10,
              currentStep: 7,
              selectedColor: Colors.white,
              unselectedColor: Colors.white24,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contact us at ",
                  style: TextStyle(color: Colors.white30),
                ),
                GestureDetector(
                  onTap: () async {
                    const url =
                        'mailto:support@foodontime.tech?subject=Food On Time Bug Reports&body=Write your findings here.';
                    if (await canLaunch(url))
                      await launch(url);
                    else
                      throw "Could not launch $url";
                  },
                  child: Text(
                    "support@foodontime.tech",
                    style: TextStyle(
                        color: Colors.white30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
