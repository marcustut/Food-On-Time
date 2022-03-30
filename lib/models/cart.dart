import 'package:flutter/material.dart';
import 'package:food_on_time/models/item.dart';

class CartModel extends ChangeNotifier {
  final Map<Item, int> _cart = {};

  Map<Item, int> get cart => _cart;

  int get totalCount => _cart.values.fold(0, (pv, e) => pv + e);

  double get totalPrice =>
      _cart.entries.fold(0, (pv, e) => pv + e.key.price * e.value);

  void removeFromCart(Item item) {
    if (!_cart.containsKey(item)) return;

    _cart.remove(item);
    notifyListeners();
  }

  void add(Item item) {
    if (_cart.containsKey(item))
      _cart[item]++;
    else
      _cart[item] = 1;
    notifyListeners();
  }

  void remove(Item item) {
    if (!_cart.containsKey(item)) return;

    if (_cart[item] > 1)
      _cart[item]--;
    else
      _cart.remove(item);

    notifyListeners();
  }

  void clear() {
    _cart.clear();
    notifyListeners();
  }
}
