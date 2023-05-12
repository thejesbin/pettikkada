import 'package:flutter/material.dart';
import 'package:pettikkada/views/screen_cart/screen_cart.dart';

import 'views/screen_home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "ScreenCart":(context)=>ScreenCart()
      },
      home: ScreenHome(),
    );
  }
}
