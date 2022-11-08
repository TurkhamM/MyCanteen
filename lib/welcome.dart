import 'package:flutter/material.dart';
import 'package:mycanteen/Login.dart';
import 'package:mycanteen/custombuttom.dart';
import 'package:mycanteen/singup.dart';
import 'package:mycanteen/themes.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 630,
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                width: 100,
              ),
            ),
            GestureDetector(
              child: CustomPrimaryButton(
                  buttonColor: Color(0xff64dd17),
                  textValue: 'Masuk',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: CustomPrimaryButton(
                  buttonColor: Color(0xffc6ff00),
                  textValue: 'Daftar',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
