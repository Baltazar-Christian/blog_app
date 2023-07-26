import 'package:blog_app/models/api_response.dart';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   centerTitle: true,
      // ),
      // backgroundColor: Color.fromARGB(218, 90, 87, 83),
      backgroundColor: Colors.black,
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/logo.png', // Replace this with your logo image file path
              height: 150, // Adjust the height of the logo as needed
            ),
            Text(
              'Email',
              style: TextStyle(
                  color: Color.fromARGB(218, 228, 135, 4), fontSize: 16),
            ),
            TextFormField(
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              obscureText: true, // Default text color
              cursorColor: Color.fromARGB(218, 228, 135, 4), //
              validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(218, 228, 135, 4).withOpacity(0.2),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              style: TextStyle(color: Colors.black), // Default text color
              cursorColor: Color.fromARGB(218, 228, 135, 4), //
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(218, 228, 135, 4).withOpacity(0.2),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(218, 228, 135, 4),
                      backgroundColor: Colors.black,
                    ),
                  )
                : kTextButton('Login', () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        _loginUser();
                      });
                    }
                  }),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint('Dont have an acount? ', 'Register', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
