import 'package:flutter/material.dart';
import 'package:food_on_time/screens/detail/components/alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_on_time/models/item.dart';
import 'package:food_on_time/constant.dart';
import 'package:food_on_time/models/cart.dart';
import 'package:food_on_time/screens/cart/components/app_bar.dart';

class CartScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    useEffect(() {
      if (cart.totalCount == 0) Navigator.of(context).pop();
      return () {};
    }, []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              AppBars(),
              createSubTitle(context),
              createCartList(context),
              footer(context)
            ],
          );
        },
      ),
    );
  }

  footer(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Helvetica",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "RM${cart.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Helvetica",
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => showAlertDialog(context),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      top: 12, left: 60, right: 60, bottom: 12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))))),
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Helvetica",
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
        margin: EdgeInsets.only(top: 16));
  }

  createSubTitle(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total(${cart.totalCount}) Items",
        style: TextStyle(
            fontSize: 12,
            fontFamily: "Helvetica",
            color: Colors.grey,
            fontWeight: FontWeight.w700),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList(BuildContext context) {
    var cart = context.watch<CartModel>();

    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: cart.cart.length,
      itemBuilder: (context, index) {
        Item key = cart.cart.keys.elementAt(index);
        return createCartListItem(context, key, cart.cart[key]);
      },
    );
  }

  createCartListItem(BuildContext context, Item item, int count) {
    var cart = context.watch<CartModel>();

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(item.imgPath))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          item.storeTitle,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Helvetica",
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        item.tags,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Helvetica",
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "RM${item.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Helvetica",
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () => cart.remove(item),
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            Icons.remove,
                                            size: 24,
                                            color: Colors.grey.shade700,
                                          )),
                                      Container(
                                        color: Colors.grey.shade200,
                                        padding: const EdgeInsets.only(
                                            bottom: 2, right: 12, left: 12),
                                        child: Text(
                                          count.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Helvetica",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () => cart.add(item),
                                          icon: Icon(
                                            Icons.add,
                                            size: 24,
                                            color: Colors.grey.shade700,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: IconButton(
                onPressed: () => cart.removeFromCart(item),
                iconSize: 20,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                )),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.deepOrange),
          ),
        )
      ],
    );
  }
}
