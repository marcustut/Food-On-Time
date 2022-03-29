import 'package:flutter/material.dart';
import 'package:food_on_time/screens/trackOrder/trackOrder.dart';
import 'package:food_on_time/screens/receipt/receipt.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;

void showAlertDialog(BuildContext context) {
  pr = new ProgressDialog(context, showLogs: true);
  pr.style(message: 'Please wait...');

  int _currentIndex = 0;

  Size size = MediaQuery.of(context).size;

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            'Select Payment Method',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          )),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: size.height * 0.3,
                width: size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Credit/Debit Card",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/icons/card.png',
                              height: size.height * 0.15,
                              fit: BoxFit.contain,
                            ),
                            Radio(
                              groupValue: _currentIndex,
                              value: 1,
                              onChanged: (int value) {
                                setState(() => _currentIndex = value);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Cash",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/icons/cash.png',
                              height: size.height * 0.15,
                              fit: BoxFit.contain,
                            ),
                            Radio(
                              groupValue: _currentIndex,
                              value: 2,
                              onChanged: (int value) {
                                setState(() => _currentIndex = value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
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
                Future.delayed(Duration(seconds: 2)).then((value) {
                  pr.hide().whenComplete(() {
                    //Put the track page here .....
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return TrackOrder();
                    //     },
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptScreen(),
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
