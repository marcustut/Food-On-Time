import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteCard extends StatelessWidget {
  final String cardTitle, cardIconSvg;
  final Function press;

  const FavouriteCard({Key key, this.cardTitle, this.cardIconSvg, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 150.0,
      height: 175.0,
      margin: EdgeInsets.only(bottom: 15, top: 15, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 20,
              color: Color(0xFF000000).withOpacity(0.32),
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SvgPicture.asset(
                cardIconSvg,
                width: size.width * 0.18,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 20.0),
                child: Text(
                  cardTitle,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
