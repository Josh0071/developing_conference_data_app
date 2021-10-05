import 'package:flutter/material.dart';
import 'package:project/widget/post_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conference App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: PostIcon(),
      debugShowCheckedModeBanner: false,
    );
  }
}
