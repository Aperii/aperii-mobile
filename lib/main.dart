import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'bottom_nav.dart';

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
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}