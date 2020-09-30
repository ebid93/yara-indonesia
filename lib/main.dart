import 'package:flutter/material.dart';
import 'package:qrcodedemo/pages/example.dart';
import 'package:qrcodedemo/pages/profile.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: <String, WidgetBuilder>{
    '/' : (context) => Example()
  },
));
