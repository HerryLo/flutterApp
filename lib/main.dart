import 'package:flutter/material.dart';

import 'router/router.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // default '/' route path
    return new MaterialApp(
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute
    );
  }
}