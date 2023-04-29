import 'package:BTechAppLatihan/models/login_model.dart';
import 'package:BTechAppLatihan/pages/home_page/homepage.dart';
import 'package:BTechAppLatihan/pages/login_page/loginpage.dart';
import 'package:flutter/material.dart';
import 'core/utils/color_pallete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTech App Final Project',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: BgaColor.bgaOrange,
        accentColor: BgaColor.bgaLightGreen100,
      ),
      home: LoginForm(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
