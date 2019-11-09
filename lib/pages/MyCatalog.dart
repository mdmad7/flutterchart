import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shopcart/models/Product.dart';
import 'package:shopcart/providers/Cart.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  var products = const [];

  Future loadProducts() async {
    String content = await rootBundle.loadString("assets/products.json");
    List collection = json.decode(content);
    List<Product> _products =
        collection.map((json) => Product.fromJson(json)).toList();

    setState(() {
      products = _products;
    });
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Cart button',
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          )
        ],
        backgroundColor: Colors.black45,
        title: Text("Catalog",
            style: TextStyle(
              fontSize: 32.0,
            )),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Product product = products[index];
          return Consumer<CartModel>(
            builder: (context, cart, child) {
              bool exists = cart.products.contains(product);
              return ListTile(
                title: Text(
                  product.name,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway"),
                ),
                // leading: CircleAvatar(
                //   child: Text(""),
                // ),
                subtitle: Text(
                  'USD ${product.price}',
                  style: TextStyle(fontFamily: "Raleway"),
                ),
                trailing: FlatButton(
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: exists ? Icon(Icons.check) : Text("Add"),
                  onPressed: exists
                      ? null
                      : () {
                          Provider.of<CartModel>(context, listen: false)
                              .add(product);
                        },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
