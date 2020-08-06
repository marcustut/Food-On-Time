import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget  {
  @override
  _RatingsWidgetState createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingBar> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> array = [];
    var filled = Colors.blue;
    var empty = Colors.black;
    for (var i = 1; i <= 5; i++) {
      array.add(IconButton(
        icon: Icon(Icons.star),
        color: (_rating < i ? empty : filled),
        onPressed: () {
          setState(() {
            _rating = i;
          });
        },
      ));
    }
    return Row(
      children: array,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}