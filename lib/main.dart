import 'package:flutter/material.dart';
import './pages/HomePage.dart';


void main()=>runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
title:"COVID-19 Updates",
theme: ThemeData.dark(),
home: HomePage(),
    );
  }
}