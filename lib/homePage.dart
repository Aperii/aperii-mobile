import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  int currentIndex;

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
      backgroundColor: Colors.black,
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
        backgroundColor: Color(0xffCC6F6F),
        brightness: Brightness.light,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Button pressed");
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xffCC6F6F),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endDocked,

      bottomNavigationBar:
        BubbleBottomBar(

          opacity: 0.2,
          backgroundColor: Colors.white,
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
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text('Home'),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.indigo,
              ),
              title: Text('Profile'),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Colors.deepPurple,
              ),
              title: Text('Settings'),
            ),
          ],
      ),

      body: (currentIndex == 0)
          ? Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pulvinar nisl nec gravida imperdiet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer sit amet pellentesque velit. Morbi id suscipit eros. Nunc fringilla quam id porta auctor. Nunc in facilisis quam, ut posuere metus. Donec finibus ullamcorper diam sed vulputate. Nullam ac quam id lectus placerat blandit. Mauris nibh felis, tempor id malesuada et, elementum sed elit. Morbi sit amet ultricies velit, vitae accumsan dolor. In hac habitasse platea dictumst. Aliquam volutpat at lectus nec hendrerit. Duis feugiat pretium libero, quis laoreet eros. Sed tempus leo ipsum, eu vulputate diam sodales eget. In pulvinar scelerisque tortor, nec auctor quam euismod mollis. Phasellus non lobortis quam, in condimentum nisl. Cras ex nisi, pellentesque non. ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white)
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
                        color: Colors.white
                    )
                ),
              ),
              Expanded(
                child: Text(
                    'Placeholder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
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