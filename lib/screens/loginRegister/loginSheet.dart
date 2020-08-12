import 'package:flutter/material.dart';
import 'package:food_on_time/screens/loginRegister/services/auth_services.dart';
import 'package:food_on_time/screens/mainMenu/mainMenu.dart';

class BottomLoginSheet extends StatefulWidget {
  @override
  _BottomLoginSheetState createState() => _BottomLoginSheetState();
}

class _BottomLoginSheetState extends State<BottomLoginSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      height: 125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(
            splashColor: Colors.grey,
            onPressed: () {
              signInWithGoogle().whenComplete(() => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainMenu()))
                  });
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            highlightElevation: 0,
            borderSide: BorderSide(color: Colors.grey),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/icons/google_logo.png"),
                  height: 13.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          OutlineButton(
            splashColor: Colors.grey,
            onPressed: () {
              signInWithFacebook().whenComplete(() => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainMenu()))
                  });
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            highlightElevation: 0,
            borderSide: BorderSide(color: Colors.grey),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/icons/facebook_logo.png"),
                  height: 23.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Sign in with Facebook",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
