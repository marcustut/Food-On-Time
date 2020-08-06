import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/getStarted/getStarted.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  final int seconds;

  const MySplashScreen({Key key, this.seconds}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: widget.seconds,
      backgroundColor: kSecondaryColor,
      title: Text(
        '\n\n\nFood On Time',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
      navigateAfterSeconds:
          GetStarted(), //Displays the Get Started page after splash screen
      loaderColor: Colors.transparent,
    );

    //Below is a failed attempt to animate the splash screen

    // return AnimatedSplash(
    //   imagePath: 'food_on_time/assets/splash_screen_pic.jpg',
    //   home: Body(),
    //   duration: 2500,
    //   type: AnimatedSplashType.StaticDuration,
    // );
  }
}

//Below is a failed attempt to format the logo with an icon in splash screen

//     return ListView(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//           Text(
//             'Food On Time',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 50,
//               fontWeight: FontWeight.bold,
//             ),
//         ),

//         Container(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 18.0),
//               child: Icon(Icons.donut_small,
//                   size: 15.0, color: Colors.yellow), //Donut logo
//             ),
//         ),
//         ],
//         ),

//         SplashScreen(
//           seconds: 30,
//           backgroundColor: kSecondaryColor,
//           navigateAfterSeconds: Body(),
//           loaderColor: Colors.transparent,
//         ),
//       ],
//     );
//   }
// }

// class AfterSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       backgroundColor: kPrimaryColor,
//       body: Padding(
//         padding:
//             EdgeInsets.only(left: 30.0, right: 30.0, top: 35.0, bottom: 30.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                   Text(
//                     'Food On Time',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),

//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 18.0),
//                     child: Icon(Icons.donut_small,
//                         size: 15.0, color: kSecondaryColor), //Donut logo
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
