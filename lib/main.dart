import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/pages/Login.dart';
import 'package:shopcart/pages/MyCart.dart';
import 'package:shopcart/pages/MyCatalog.dart';
import 'package:shopcart/providers/Cart.dart';

void main() => runApp(ChangeNotifierProvider<CartModel>(
      builder: (context) => CartModel(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Lora",
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/login': (context) => Login(),
        '/': (context) => MyCatalog(),
        '/cart': (context) => MyCart(),
      },
    );
  }
}
