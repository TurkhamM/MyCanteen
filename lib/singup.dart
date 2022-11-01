import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycanteen/Login.dart';
import 'package:mycanteen/custombuttom.dart';
import 'package:mycanteen/pages/HomePage.dart';
import 'package:mycanteen/themes.dart';
import 'package:mycanteen/widget/ceckbox.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();

  Future regrister() async {
    // print(data);
    if (username.text.isEmpty && nama.text.isEmpty && password.text.isEmpty) {
      Alert(
              context: context,
              title: "Data Tidak Boleh Kosong",
              type: AlertType.warning)
          .show();
    } else if (username.text.isEmpty) {
      Alert(
              context: context,
              title: "Username Tidak Boleh Kosong",
              type: AlertType.warning)
          .show();
    } else if (nama.text.isEmpty) {
      Alert(
              context: context,
              title: "Nama Tidak Boleh Kosong",
              type: AlertType.warning)
          .show();
    } else if (password.text.isEmpty) {
      Alert(
              context: context,
              title: "Password Tidak Boleh Kosong",
              type: AlertType.warning)
          .show();
    } else {
      ProgressDialog pd = ProgressDialog(context: context);

      /// Set options
      /// Max and msg required
      pd.show(
        max: 100,
        msg: 'Daftar....',
        progressBgColor: Colors.transparent,
      );
      for (int i = 0; i <= 100; i++) {
        /// You don't need to update state, just pass the value.
        /// Only value required
        pd.update(value: i);
        i++;
        await Future.delayed(Duration(milliseconds: 50));
      }
      var url =
          Uri.http("192.168.1.15", "/login/api/register.php", {'q': '{http}'});
      var response = await http.post(url, body: {
        "username": username.text,
        "nama": nama.text,
        "password": password.text
      });
      var data = json.decode(response.body);
      if (data.toString() == "Error") {
        Alert(
                context: context,
                title: "Username Sudah Terdaftar",
                type: AlertType.warning)
            .show();
        ;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        Alert(
                context: context,
                title: "Berhasil Membuat Akun",
                type: AlertType.success)
            .show();
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Akun',
                  style: TextStyle(
                      fontSize: 34,
                      color: textBlack,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/LG.png',
                  width: 99,
                  height: 4,
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: heading6.copyWith(color: textGrey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        controller: nama,
                        decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: heading6.copyWith(color: textGrey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextFormField(
                        controller: password,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                            hintText: 'Password ',
                            hintStyle: heading6.copyWith(color: textGrey),
                            suffixIcon: IconButton(
                              color: textGrey,
                              splashRadius: 1,
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckbox(),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dengan membuat akun, Anda menyetujui',
                      style: regular16pt.copyWith(color: textGrey),
                    ),
                    Text(
                      'Syarat & Ketentuan',
                      style: regular16pt.copyWith(color: Color(0xff64dd17)),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            CustomPrimaryButton(
                buttonColor: Color(0xff64dd17),
                textValue: 'Daftar',
                textColor: Colors.white,
                onPressed: () {
                  regrister();
                }),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Saya sudah punya akun? ',
                  style: regular16pt.copyWith(color: textGrey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Login',
                    style: regular16pt.copyWith(color: Color(0xff64dd17)),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
