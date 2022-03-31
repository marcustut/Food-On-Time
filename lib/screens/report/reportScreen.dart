import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/screens/report/list_item.dart';

class ReportScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var listProduct = getListProduct();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Report"),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          ...listProduct.entries
              .map((e) => ListItem(e.key, e.value[0].toInt(), e.value[1]))
        ],
      )),
    );
  }

  Map<String, List<double>> getListProduct() => {
        "January": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "February": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "March": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "April": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "May": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "June": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "July": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "August": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "September": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "October": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "November": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
        "December": [
          (1000 + Random().nextInt(2412 - 1000)).toDouble(),
          18000 + Random().nextInt(28944 - 18000) + Random().nextDouble()
        ],
      };
}
