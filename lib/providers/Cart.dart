import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shopcart/models/Product.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Product> _products = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _products
      .map((product) => product.price)
      .toList()
      .fold(0, (previous, current) => previous + current);

  /// Adds [product] to cart. This is the only way to modify the cart from outside.
  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  /// Removes [product] from cart. This is the only way to modify the cart from outside.
  void remove(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
