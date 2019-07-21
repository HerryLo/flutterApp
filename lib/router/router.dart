import 'package:flutter/material.dart';

import '../pages/IndexPage.dart';

final routers = {
  '/': (BuildContext context)=> IndexPage()
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;

  final Function pageContextBuilder = routers[name];

    final arguments = settings.arguments;
    if(arguments != null){
      final route = MaterialPageRoute(
          builder: (BuildContext context) =>
              pageContextBuilder(context, arguments)
      );
      return route;
    }else {
      final route = MaterialPageRoute(
          builder: (BuildContext context) =>
              pageContextBuilder(context)
      );
      return route;
    };
};