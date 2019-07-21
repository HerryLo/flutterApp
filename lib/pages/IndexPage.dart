import "package:flutter/material.dart";

import '../components/IndexSeachInput.dart';

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

  /// 构建首页容器
  Widget _buildIndexContainer() {
    return new Container(
      color: Color(0xeeeeeeee),
      child: new Column(
        children: <Widget>[
          SearchInputComponent()
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垃圾分类助手'),
      ),
      body: _buildIndexContainer(),
    );
  }
}