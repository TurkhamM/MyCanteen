import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycanteen/custombuttom.dart';
import 'package:mycanteen/pages/HomePage.dart';
import 'package:mycanteen/singup.dart';
import 'package:mycanteen/themes.dart';
import 'package:mycanteen/widget/ceckbox.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    if (username.text.isEmpty && password.text.isEmpty) {
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
    } else if (password.text.isEmpty) {
      Alert(
              context: context,
              title: "Password Tidak Boleh Kosong",
              type: AlertType.warning)
          .show();
    } else {
      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(
        max: 100,
        msg: 'Login....',
        progressBgColor: Colors.transparent,
      );
      for (int i = 0; i <= 100; i++) {
        pd.update(value: i);
        i++;
        await Future.delayed(Duration(milliseconds: 50));
      }

      var url =
          Uri.http("192.168.1.15", '/login/api/login.php', {'q': '{http}'});
      var response = await http.post(url, body: {
        "username": username.text,
        "password": password.text,
      });
      var data = json.decode(response.body);
      if (data.toString() == "Success") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        Alert(context: context, title: "Login Gagal", type: AlertType.error)
            .show();
      }
    }
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/LG.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk MyCanteen',
                    style: heading1.copyWith(color: textBlack),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: password,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: IconButton(
                            color: textGrey,
                            splashRadius: 1,
                            icon: Icon(passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: togglePassword,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Belum Punya Akun?',
                      style: TextStyle(fontSize: 13, color: Color(0xff64dd17)),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckbox(),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Ingatkan Saya',
                    style: regular16pt,
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              CustomPrimaryButton(
                  buttonColor: Color(0xff64dd17),
                  textValue: 'Login',
                  textColor: Colors.white,
                  onPressed: () {
                    login();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
