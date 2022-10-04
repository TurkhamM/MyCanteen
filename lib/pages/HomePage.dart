import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycanteen/pages/CardPage.dart';

import '../widget/AppBarWidget.dart';
import '../widget/CategoriesWidget.dart';
import '../widget/DrawerWidget.dart';
import '../widget/NewsItemsWidget.dart';
import '../widget/PopularItemWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Custom App Bar
          AppBarWidget(),

          // search
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: Colors.red,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Apa yang anda suka dan ingin?",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    // Icon(Icons.filter_list),
                  ],
                ),
              ),
            ),
          ),
          // category
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Kategori",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          CategoriesWidget(),

          // PopularItemWidget
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Rekomendasi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          PopularItemWidget(),

          // NewsItemWidget
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Berita Makanan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // NewsItemsWidget
          NewsItemsWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ]),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CardPage();
                },
              ),
            );
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
