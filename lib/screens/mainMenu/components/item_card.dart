import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';

class ItemCard extends StatelessWidget {
  final String title, address, imgUrl;
  final Function press;

  const ItemCard({Key key, this.title, this.address, this.imgUrl, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 250.0,
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
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 300.0,
                      height: 125.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    address,
                    style: TextStyle(color: kTextColor),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 120.0,
                          height: 10.0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    '#AMERICA #BURGER',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '213 check-ins',
                        style: TextStyle(color: kTextColor),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.near_me,
                            size: 13,
                          ),
                          Text(
                            ' 1.2 km',
                            style: TextStyle(color: kTextColor),
                          ),
                        ],
                      ),
                    ],
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
