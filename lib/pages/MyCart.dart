import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/models/Product.dart';
import 'package:shopcart/providers/Cart.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",
            style: TextStyle(
              fontSize: 32.0,
            )),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: ListView.separated(
                  itemCount: cart.products.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Product product = cart.products[index];
                    return ListTile(
                      subtitle: Text(
                        product.name,
                        style: TextStyle(fontFamily: "Raleway"),
                      ),
                      title: Text(
                        'USD ${product.price}',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway"),
                      ),
                      trailing: FlatButton(
                        // color: Colors.amber,
                        textColor: Colors.red,
                        child: Icon(Icons.close),
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .remove(product);
                        },
                      ),
                    );
                  },
                )),
                Container(
                  child: Center(
                      child: Text(
                    "Total Cost is ${cart.totalPrice}",
                    style: TextStyle(fontSize: 24.0),
                  )),
                  color: Colors.black38,
                  height: 240.0,
                ),
              ]);
        },
      ),
    );
  }
}
