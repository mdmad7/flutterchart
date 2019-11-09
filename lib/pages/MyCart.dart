import 'package:flutter/material.dart';

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
      body: Text("List"),
    );
  }
}
