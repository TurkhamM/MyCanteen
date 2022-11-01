import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycanteen/Login.dart';
import 'package:mycanteen/pages/CardPage.dart';
import 'package:mycanteen/pages/HomePage.dart';
import 'package:mycanteen/pages/SetinggUI.dart';
import 'package:mycanteen/welcome.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text(
                "Programer",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "HalloProgramer@etc.com",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/avatar.png"),
              ),
            ),
          ),
          // title list view
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.green,
              ),
              title: Text(
                "BERANDA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // title list view
          Container(
            child: ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.green,
              ),
              title: Text(
                "AKUN SAYA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // title list view
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CardPage();
                    },
                  ),
                );
              },
              leading: Icon(
                CupertinoIcons.cart,
                color: Colors.green,
              ),
              title: Text(
                "ORDER",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // title list view
          Container(
            child: ListTile(
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.green,
              ),
              title: Text(
                "FAVORIT",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // title list view
          Container(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.green,
              ),
              title: Text(
                "PENGATURAN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // title list view
          Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Welcome();
                    },
                  ),
                );
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.green,
              ),
              title: Text(
                "KELUAR",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
