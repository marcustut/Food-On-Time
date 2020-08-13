import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:food_on_time/screens/review/review-screen.dart';

ProgressDialog pr;

void showAlertDialog(BuildContext context) {
  pr = new ProgressDialog(context, showLogs: true);
  pr.style(message: 'Please wait...');

  int _currentIndex = 0;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Payment Method :'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                RadioListTile(
                  title: Text("Cash"),
                  groupValue: _currentIndex,
                  value: 1,
                  onChanged: (int value) {
                    setState(() => _currentIndex = value);
                  },
                ),
                RadioListTile(
                  title: Text("Credit Card"),
                  groupValue: _currentIndex,
                  value: 2,
                  onChanged: (int value) {
                    setState(() => _currentIndex = value);
                  },
                ),
              ]);
            },
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('CONFIRM'),
              onPressed: () {
                pr.show();
                Future.delayed(Duration(seconds: 3)).then((value) {
                  pr.hide().whenComplete(() {
                    //Put the track page here .....
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ReviewScreen();
                        },
                      ),
                    );
                  });
                });
              },
            )
          ],
        );
      });
}
