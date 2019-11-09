import 'package:flutter/material.dart';
import 'package:shopcart/pages/Login.dart';
import 'package:shopcart/pages/MyCart.dart';
import 'package:shopcart/pages/MyCatalog.dart';

void main() => runApp(MyApp());

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
      initialRoute: '/cart',
      routes: {
        '/login': (context) => Login(),
        '/': (context) => MyCatalog(),
        '/cart': (context) => MyCart(),
      },
    );
  }
}
