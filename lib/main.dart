import 'package:flutter/material.dart';
import 'package:flutter_app_list/water_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new WaterPage(),
    );
  }
}
