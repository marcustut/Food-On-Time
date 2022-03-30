import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/loginRegister/loginSheet.dart';
import 'package:food_on_time/screens/mainMenu/components/app_bar.dart';
import 'package:food_on_time/screens/trackOrder/trackOrder.dart';
import 'package:food_on_time/screens/mainMenu/mainMenu.dart';
import 'package:food_on_time/screens/receipt/components/receiptItem.dart';
import 'package:food_on_time/screens/receipt/components/receiptNewline.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart'; //for date locale
import 'components/app_bar.dart';

class ReceiptScreen extends StatelessWidget {
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String time = DateFormat("HH:mm:ss").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                "Order Receipt",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              padding: EdgeInsets.fromLTRB(27, 15, 27, 15),
              child: Text(
                "Jalan Tumbuhan, Tunku Abdul Rahman University College, 53100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia.",
                style: TextStyle(
                  color: kTextLightColor,
                  fontFamily: "SourceCodePro",
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            ReceiptNewline(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Date: " + date,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Order No: 1227",
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Time: " + time,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Host: Liana",
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            ReceiptNewline(),
            ReceiptItem(
                itemName: "SPAGHETTI WITH HOT DOG & MINCED CHICKEN",
                amount: "4.50"),
            ReceiptItem(
                itemName: "HAKKA NOODLE WITH MUSHROOM & MINCED CHICKEN",
                amount: "4.00"),
            ReceiptItem(
                itemName: "RAMEN SOUP WITH SMOKED DUCK BREAST", amount: "5.00"),
            ReceiptItem(
                itemName: "SZE CHUAN \"TAN TAN\" RAMEN", amount: "4.50"),
            ReceiptItem(
                itemName: "RICE NOODLE SZE CHUAN MA LA SOUP WITH BOILED EGG",
                amount: "5.50"),
            ReceiptItem(
                itemName: "KUAI TEOW SOUP WITH FISH BALL & SEAWEED",
                amount: "4.00"),
            ReceiptNewline(),
            ReceiptItem(itemName: "SUBTOTAL: ", amount: "27.50"),
            ReceiptItem(itemName: "TAX (10% SST): ", amount: "2.75"),
            Container(
              decoration: BoxDecoration(
                color: kSecondaryColor,
              ),
              child: ReceiptItem(itemName: "TOTAL AMOUNT: ", amount: "30.25"),
            ),
            ReceiptNewline(),
            Container(
              padding: EdgeInsets.fromLTRB(27, 15, 27, 15),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text(
                "Thank you for dining with us! Please come again. Follow us on social media for up-to-date promotions and special offers.",
                style: TextStyle(
                  color: kTextLightColor,
                  fontFamily: "SourceCodePro",
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: kButtonColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TrackOrder();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "TRACK ORDER",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15),
                  ),
                )),
          ],
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
