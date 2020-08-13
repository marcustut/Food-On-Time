import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:async/async.dart';
import 'package:food_on_time/screens/review/components/rating_bar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int tag = 1;
  int tag2 = 1;
  List<String> tags1 = [];
  List<String> tags2 = [];
  List<String> options1 = ['Delicious', 'Clean', 'Dump', 'Moderate'];

  List<String> options2 = ['Fast', 'Polite', 'Rude', 'Slow', 'Troublesome'];

  String user;
  final usersMemoizer = AsyncMemoizer<List<ChipsChoiceOption<String>>>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Container(
          child: Row(children: <Widget>[
            new Text(
              "Rate Your Meals :",
              style: new TextStyle(color: Colors.white, fontSize: 20),
            )
          ]),
        ),
        //Rating Bar
        Container(
          child: Row(children: <Widget>[RatingBar()]),
        ),
        Content(
          title: 'Enjoyed the Meal ?',
          child: ChipsChoice<String>.multiple(
            value: tags1,
            options: ChipsChoiceOption.listFrom<String, String>(
              source: options1,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
            onChanged: (val) => setState(() => tags1 = val),
          ),
        ),
        Container(
          child: Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
            child: Container(height: 1.0, width: 430.0, color: Colors.white),
          ),
        ),
        Container(
          child: Row(children: <Widget>[
            new Text(
              "Rate The Delivery :",
              style: new TextStyle(color: Colors.white, fontSize: 20),
            )
          ]),
        ),
        //Rating Bar
        Container(
          child: Row(children: <Widget>[RatingBar()]),
        ),
        Content(
          title: "How's the Delivery?",
          child: ChipsChoice<String>.multiple(
            value: tags2,
            options: ChipsChoiceOption.listFrom<String, String>(
              source: options2,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
            onChanged: (val) => setState(() => tags2 = val),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          width: double.infinity,
          child: Align(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      showDialog(
                          context: context,
                          child: new AlertDialog(
                            title: new Text("Review"),
                            content: new Text(
                                "You are earn 10 reward point. Thank You! For your review."),
                          ));
                    },
                    color: Colors.yellow,
                    textColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.grey,
                  )
                ]),
          ),
        ),
      ],
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Function(bool selected) onSelect;

  CustomChip(this.label, this.selected, this.onSelect, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 100,
      width: 70,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: selected ? Colors.green : Colors.grey,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => onSelect(!selected),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Visibility(
                visible: selected,
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 32,
                )),
            Positioned(
              left: 9,
              right: 9,
              bottom: 7,
              child: Container(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String title;
  final Widget child;

  Content({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.blueGrey[50],
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w500),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
