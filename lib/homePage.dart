import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  int currentIndex;
  final storage = new FlutterSecureStorage();

  Future<void> postsFunc() async {
    String token = await storage.read(key: "token");
    print(token);
    var response = await http.get(
        Uri.parse('https://aperii.com/api/v1/posts/all'),
        headers: {
          "authorization": token,
        }
    ).timeout(const Duration(seconds: 30));

    print(response.body);

    //Map data = json.decode(response.body);
    var data = await json.decode(json.encode(response.body));
    print(data);
  }

  @override
  void initState() {
    super.initState();

    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0d0f),
      appBar: AppBar(
        /*title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),*/
        backgroundColor: Color(0xff0a0d0f),
        brightness: Brightness.light,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postsFunc();
        },
        child: Icon(Icons.add_box),
        backgroundColor: Color(0xffCC6F6F),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endDocked,

      bottomNavigationBar:
        BubbleBottomBar(

          opacity: 0.2,
          backgroundColor: Color(0xff212a31),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
          currentIndex: currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
          items: [
            BubbleBottomBarItem(
              backgroundColor: Color(0xfff65c51),
              icon: Icon(
                Icons.home,
                color: Color(0xffDFDFDF),
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Home'),
            ),
            BubbleBottomBarItem(
              backgroundColor: Color(0xff5969c5),
              icon: Icon(
                Icons.account_circle,
                color: Color(0xffDFDFDF),
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: Color(0xff6877ca),
              ),
              title: Text('Profile'),
            ),
            BubbleBottomBarItem(
              backgroundColor: Color(0xff8b64ce),
              icon: Icon(
                Icons.settings,
                color: Color(0xffDFDFDF),
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Color(0xff8b64ce),
              ),
              title: Text('Settings'),
            ),
          ],
      ),

      body: (currentIndex == 0)
          ? Center(
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffdbdbdb),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                Text(
                    "Username",
                    style: TextStyle(color: Colors.white)
                ),
                Text(
                    "@username",
                    style: TextStyle(color: Colors.white)
                ),
                Text(
                    "Body Text",
                    style: TextStyle(color: Colors.white)
                )
              ],
            )
        ),

      )
          : (currentIndex == 1)
          ? Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                    'Username:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffDFDFDF)
                    )
                ),
              ),
              Expanded(
                child: Text(
                    'Placeholder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffDFDFDF)
                    )
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: const FlutterLogo(),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                    'Your Posts:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              child:
              Row(
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: const FlutterLogo(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              )
          )
        ],
      )
          : InkWell(
        child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
                ),
        ),
        onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));},
      ),
    );
  }
}