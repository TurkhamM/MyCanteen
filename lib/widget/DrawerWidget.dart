import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.green,
            ),
            title: Text(
              "BERANDA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // title list view
          ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.green,
            ),
            title: Text(
              "AKUN SAYA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // title list view
          ListTile(
            leading: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.green,
            ),
            title: Text(
              "ORDER",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // title list view
          ListTile(
            leading: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.green,
            ),
            title: Text(
              "FAVORIT",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // title list view
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.green,
            ),
            title: Text(
              "PENGATURAN",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ), // title list view
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.green,
            ),
            title: Text(
              "KELUAR",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
