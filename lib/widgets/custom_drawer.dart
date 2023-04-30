import 'dart:convert';

import 'package:BTechAppLatihan/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BgaDrawer extends StatelessWidget {

  Future<void> clearUserData() async {
    final jsonFile = await rootBundle.loadString('assets/data/login_data.json');
    final data = json.decode(jsonFile);
    data['login'] = [];
    // final updatedData = json.encode(data);

    // final file = File('assets/login_data.json');
    // await file.writeAsString(updatedData);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * (3/4); // Menghitung lebar drawer sebesar 1/3 dari lebar layar

    return Drawer(
      backgroundColor: BgaColor.bgaWhiteA700,
      width: drawerWidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              color: BgaColor.bgaWhiteA700,
              child: Row(
                children: [
                  CircleAvatar( backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/userdrawer.png'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //fetchdata
                            'SUBAGIYO',
                            style: TextStyle(
                              color: BgaColor.bgaBlack900,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            //fetchdata
                            'Mandor Panen Divisi -Divisi 01',
                            style: TextStyle(
                              color: BgaColor.bgaBlack900,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.print, color: BgaColor.bgaOrange,),
              title: Text('Setting Printer',
                style: TextStyle(
                    fontFamily: 'Poppins',
                fontSize: 13),),
              onTap: () {
                // Navigate to home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: BgaColor.bgaOrange,),
              title: Text('Pengaturan Aplikasi',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13),),
              onTap: () {
                // Navigate to settings screen
              },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app, color: BgaColor.bgaOrange,),
              title: Text('Logout',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13),
              ),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi Logout'),
                      content: Text('Anda yakin ingin logout?'),
                      actions: <Widget>[
                        TextButton(
                          style:ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(BgaColor.bgaOrange),
                            foregroundColor: MaterialStateProperty.all<Color>(BgaColor.bgaWhiteA700),
                          ),
                          child: Text('Batal', selectionColor: BgaColor.bgaWhiteA700,style: TextStyle(fontFamily: 'Poppins', color: BgaColor.bgaWhiteA700),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(BgaColor.bgaOrange),
                            foregroundColor: MaterialStateProperty.all<Color>(BgaColor.bgaWhiteA700),

                    ),
                          child: Text('Logout', selectionColor: BgaColor.bgaOrange,style: TextStyle(fontFamily: 'Poppins', color: BgaColor.bgaWhiteA700),),
                          onPressed: () async {
                            await clearUserData();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login',
                                  (route) => false,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
