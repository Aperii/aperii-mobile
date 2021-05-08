import 'package:flutter/material.dart';
import 'homePage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainter(),
        child: _buildLoginLayout(),
      ),
    );
  }

  Widget _buildLoginLayout() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: AppLogo(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildLoginFields(),
        )
      ],
    );
  }

  Widget _buildLoginFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildEmailField(),
            SizedBox(
              height: 10.0,
            ),
            _buildPasswordField(),
            SizedBox(
              height: 20.0,
            ),
            _buildSubmitButton(),
            SizedBox(
              height: 10.0,
            ),
            _buildRegisterText(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
      },
      color: Colors.blueAccent[200],
      child: Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildRegisterText() {
    return Text(
      'REGISTER',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50.0),
        width: 128.0,
        height: 128.0,
        child: Image.asset('assets/logo.png')
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red[300];
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}