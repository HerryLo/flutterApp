import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/router.dart';

import './provider/indexPageProvider.dart';

final indexData = IndexDataInfo();

void main() {
  Provider.debugCheckInvalidValueType = null;

  return runApp(
      MultiProvider(providers: [
        Provider<IndexDataInfo>.value(value: indexData),
      ],
          child: new MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute
    );
  }
}