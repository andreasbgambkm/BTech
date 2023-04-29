import 'dart:convert';
import 'package:BTechAppLatihan/core/utils/color_pallete.dart';
import 'package:BTechAppLatihan/core/utils/theme/app_decoration.dart';
import 'package:BTechAppLatihan/models/login_model.dart';
import 'package:BTechAppLatihan/pages/home_page/components/home_gps.dart';
import 'package:BTechAppLatihan/pages/home_page/components/home_header.dart';
import 'package:BTechAppLatihan/pages/home_page/components/home_menu.dart';
import 'package:BTechAppLatihan/pages/home_page/components/home_rkh.dart';
import 'package:BTechAppLatihan/pages/home_page/components/home_tasks.dart';
import 'package:BTechAppLatihan/widgets/custom_bottom_navigation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class HomePage extends StatelessWidget {
  static String routeName = "/home";
  late int currentIndex;
  LoginModel? user;

  HomePage({super.key});





  Future<void> clearUserData() async {
    final jsonFile = await rootBundle.loadString('assets/data/login_data.json');
    final data = json.decode(jsonFile);
    data['login'] = [];
    // final updatedData = json.encode(data);

    // final file = File('assets/login_data.json');
    // await file.writeAsString(updatedData);
  }
  List<Widget> _pageList = [];
  Future<void> _getUser() async {

  }







@override
Widget build(BuildContext context) {


  return SafeArea(
      child: Scaffold(
      backgroundColor: BgaColor.bgaWhiteA700,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top/2.5,
                  ),
                HomeHeader(),

                  HomeGps(),

                  HomeRkh(),

                  HomeMenu(),

                  HomeTasks(),


                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BubbleBottomBar(
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          opacity: .2,
        // currentIndex: currentIndex,
          //onTap: changePage,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ), //border radius doesn't work when the notch is enabled.
          elevation: 8,
          tilesPadding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: BgaColor.bgaOrange,
              icon: Icon(
                Icons.home_filled,
                color: BgaColor.bgaOrange,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: BgaColor.bgaOrange,
              ),
              title: Text("Beranda"),
            ),
            BubbleBottomBarItem(
                backgroundColor: BgaColor.bgaOrange,
                icon: Icon(
                  Icons.dashboard,
                  color: BgaColor.bgaOrange,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: BgaColor.bgaOrange,
                ),
                title: Text("Logs")),



          ],
        ),

      ),
    );
  }
}
