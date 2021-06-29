import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'homePage.dart';
import 'signUpPage.dart';

void main() => runApp(MyApp());

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/logo.png');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aperii',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignUp(),
        '/home': (BuildContext context) => new Home(),
      },
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newPassword, newUsername;

  final storage = new FlutterSecureStorage();

  Future<void> loginFunc(username, password) async {
    var response = await http.post(
        Uri.parse('https://aperii.com/api/v1/auth/login'),
        body: {
          "username": username,
          "password": password,
        }
    );

    Map data = json.decode(response.body);
    await storage.write(key: "token", value: data['token']);
    print("Logged in!");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff0a0d0f),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
                          child: Text('Welcome',
                              style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold, color: Color(0xffDFDFDF)
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 75.0, 0.0, 0.0),
                          child: Text('to Aperii',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffDFDFDF)
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(315.0, 75.0, 0.0, 0.0),
                          child: Text('.',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff9d4d4d))),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'USERNAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffCBCBCB)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffC2C2C2)
                                    )
                                )
                            ),
                            onChanged: (username) {
                              newUsername = username;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffCBCBCB)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffC2C2C2)))),
                            obscureText: true,
                            onChanged: (password) {
                              newPassword = password;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Color(0xff9d4d4d),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/home');
                              loginFunc(newUsername, newPassword);
                            },
                              child: Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Color(0xffCC6F6F),
                                  color: Color(0xff9d4d4d),
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(height: 20.0),
                        ],
                      )),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New to Aperii?',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xffDFDFDF)
                        ),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xff9d4d4d),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          )

        ));
  }
}

/* class User {
    /*
    This class encapsulates the json response from the api
    {
        'userId': '1908789',
        'username': username,
        'name': 'Peter Clarke',
        'lastLogin': "23 March 2020 03:34 PM",
        'email': 'x7uytx@mundanecode.com'
    }
    */
    String _userId;
    String _username;
    String _name;
    String _lastLogin;
    String _email;

    // constructorUser(
        {String userId,
          String username,
          String name,
          String lastLogin,
          String email}) {
  this._userId = userId;
  this._username = username;
  this._name = name;
  this._lastLogin = lastLogin;
  this._email = email;
  }

  // Properties
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get username => _username;
  set username(String username) => _username = username;
  String get name => _name;
  set name(String name) => _name = name;
  String get lastLogin => _lastLogin;
  set lastLogin(String lastLogin) => _lastLogin = lastLogin;
  String get email => _email;
  set email(String email) => _email = email;

  // create the user object from json input
  User.fromJson(Map<String, dynamic> json) {
  _userId = json['userId'];
  _username = json['username'];
  _name = json['name'];
  _lastLogin = json['lastLogin'];
  _email = json['email'];
  }

  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['username'] = this._username;
    data['name'] = this._name;
    data['lastLogin'] = this._lastLogin;
    data['email'] = this._email;
    return data;
  }
} */