import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/mainMenu/mainMenu.dart';
import '../../mainMenu/mainMenu.dart';

class AppBars extends PreferredSize  {
  @override
  Size get preferredSize => Size.fromHeight(50); // set height of your choice
  @override
  Widget build(BuildContext context) {
        return AppBar(
          backgroundColor: kPrimaryColor,
          title: new Text('Review'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainMenu();
                  },
                ),
              );
            },
          ),
          actions: <Widget>[
            new IconButton(
                color: Colors.white,
                icon: new Icon(Icons.close),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainMenu();
                      },
                    ),
                  );
                },
              ),
              
            ],
            

        );
      }
  }
