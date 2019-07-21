import "package:flutter/material.dart";

import '../components/IndexSeachInput.dart';
import '../components/IndexCard.dart';

// index page
class IndexPage extends StatefulWidget {

//  Map arguments;
//  IndexPage({Key key, this.arguments}) : super(key: key);

  @override
  createState() =>
      new _IndexPageState();
//    new _IndexPageState(arguments: this.arguments);
}

class _IndexPageState extends State<IndexPage> {
//  Map arguments;

//  _IndexPageState({
//    this.arguments
////  });

  // buidler index Container
  Widget _buildIndexContainer() {
    return new Container(
      color: Color(0xeeeeeeee),
      child: new Column(
        children: <Widget>[
          SearchInputComponent(),
          CardComponent()
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('垃圾分类助手'),
      ),
      body: _buildIndexContainer(),
    );
  }
}