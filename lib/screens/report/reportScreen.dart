import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_on_time/screens/report/list_item.dart';

class ReportScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> list_product = get_list_product();

    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        // title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          for (final map in list_product)
            for (final keys in map.keys) ListItem(keys, map[keys].toList()),
        ],
      )),
    );
  }

  List<Map<dynamic, dynamic>> get_list_product() {
    List<Map<dynamic, dynamic>> listProduct = new List();
    for (var k = 1; k <= 12; k++) {
      Map map = Map();
      map.putIfAbsent(getMonth(k), () => getWeeks());
      listProduct.add(map);
    }
    return listProduct.map((s) {}).map((list) => list).toList();
  }

  String getMonth(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "Febraury";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
    }
  }

  List<dynamic> getWeeks() {
    return [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saterday",
      "Sunday",
    ].toList();
  }
}
