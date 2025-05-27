import 'package:flutter/material.dart';
import 'package:test_scrol/cartModel.dart';

class Cartprovider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  // add a product to the cart.
  void addCart(Map<String, dynamic> grocery) {
    if (productExist(grocery)) {
      int index = _carts.indexWhere(
        (element) => element.grocery['key'] == grocery['key'],
      );
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      _carts.add(CartModel(grocery: grocery, quantity: 1));
    }
    notifyListeners();
  }

  // increase the quantity of prouduct in the cart
  void addQuantity(Map<String, dynamic> grocery) {
    int index = _carts.indexWhere(
      (element) => element.grocery['key'] == grocery['key'],
    );
    if (index != -1) {
      // ensure the product exists
      _carts[index].quantity = _carts[index].quantity + 1;
      notifyListeners();
    }
  }

  // decrease the quantity of prouduct in the cart
  void reduceQuantity(Map<String, dynamic> grocery) {
    int index = _carts.indexWhere(
      (element) => element.grocery['key'] == grocery['key'],
    );
    if (index != -1) {
      // ensure the quantity is greater than 1
      _carts[index].quantity = _carts[index].quantity - 1;
      notifyListeners();
    } else if (index != -1 && _carts[index].quantity == 1) {
      // removeFromCart(product);
    }
  }

  //check if a product already exist in the cart.
  bool productExist(Map<String, dynamic> grocery) {
    return _carts.indexWhere(
          (element) => element.grocery['key'] == grocery['key'],
        ) !=
        -1;
  }

  // remove a product from the cart
  void removeFromCart(Map<String, dynamic> grocery) {
    int index = _carts.indexWhere(
      (element) => element.grocery['key'] == grocery['key'],
    );
    if (index != -1) {
      _carts.removeAt(index);
      notifyListeners();
    }
  }

  // calcuulates the total price of all items in the cart
  double totalCart() {
    double total = 0;
    for (var i = 0; i < _carts.length; i++) {
      total +=
          _carts[i].quantity *
          double.parse(_carts[i].grocery['productPrice'].toString());
    }
    return total;
  }
}
