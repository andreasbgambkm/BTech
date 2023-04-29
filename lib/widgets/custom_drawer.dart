import 'package:flutter/material.dart';

class BgaDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('John Doe'),
                accountEmail: Text('johndoe@example.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('JD'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Navigate to home screen
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Navigate to settings screen
                },
              ),
            ],

        ),

    );
  }
}
