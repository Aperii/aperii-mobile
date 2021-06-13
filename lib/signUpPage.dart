import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Text('Sign Up',
                              style: TextStyle(
                                  fontSize: 80.0, fontWeight: FontWeight.bold, color: Color(0xffDFDFDF)
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16.0, 75.0, 0.0, 0.0),
                          child: Text('for Aperii',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffDFDFDF)
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(345.0, 75.0, 0.0, 0.0),
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
                            decoration: InputDecoration(
                                labelText: 'DISPLAY NAME',
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
                          ),
                          SizedBox(height: 20.0),
                          TextField(
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
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
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
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffCBCBCB)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xffC2C2C2)))),
                            obscureText: true,
                          ),
                          SizedBox(height: 5.0),
                          Container(
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
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      )),
                  SizedBox(height: 15.0)
                ],
              )
          )
        )
    );
  }
}