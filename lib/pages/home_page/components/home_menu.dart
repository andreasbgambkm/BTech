import 'package:BTechAppLatihan/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column (

        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCardMenu(
                title: 'CheckIn',
                counter: 0,
                route: '/checkin',
               ),
              CustomCardMenu(title: 'CheckOut', counter: 0),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCardMenu(title: 'Asistensi Masuk', counter: 0),
              CustomCardMenu(title: 'Asistensi Keluar', counter: 0),
            ],
          )

        ],
      ),
    );
  }
}
