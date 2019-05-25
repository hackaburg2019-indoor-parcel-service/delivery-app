import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_delivery/singletons/Userdata.dart';

import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool waitingForLoginResponse = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (waitingForLoginResponse) {
      return Scaffold(body: Center(child: Text('Trying to login')));
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Image.asset('assets/open-box.png'),
                SizedBox(height: 20.0),
                Text('Indoor Parcel Station'),
              ],
            ),
            SizedBox(height: 60.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
              ),
              controller: usernameController,
            ),
            SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
              ),
              obscureText: true,
              controller: passwordController,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    _login();
                    // Navigator.pushReplacementNamed(context, '/home');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      waitingForLoginResponse = true;
    });
    var map = new Map<String, dynamic>();
    map['username'] = usernameController.text;
    map['password'] = passwordController.text;
    final response = await http.post(
        'http://app02.dev.nue.schneider-its.net:3001/v1/auth/login',
        body: map);

    if (response.statusCode == 200) {
      setState(() {
        waitingForLoginResponse = false;
      });
      LoginResponse loginResponse = LoginResponse.fromJson(json.decode(response.body));
      print(loginResponse.token);
      userData.token = loginResponse.token;
      userData.user = loginResponse.user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        waitingForLoginResponse = false;
      });
    }
  }
}

void loginTest(String _username, String _password) async {
  var map = new Map<String, dynamic>();
  map["username"] = _username;
  map["password"] = _password;
  final response = await http.post(
      'http://app02.dev.nue.schneider-its.net:3001/v1/auth/login',
      body: map);
  print(response.body);
}

class LoginResponse {
  final String token;
  final String user;

  LoginResponse({this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(user: json['data']['user'], token: json['data']['token']);
  }
}
