import "package:flutter/material.dart";

import "package:provider/provider.dart";
import '../provider/indexPageProvider.dart';

import '../components/IndexSeachInput.dart';
import '../components/IndexCard.dart';
import '../components/IndexListView.dart';

class IndexPage extends StatelessWidget {

  // 构建首页容器
  Widget _buildIndexContainer() {
    return new Container(
        color: Color(0xeeeeeeee),
        child: new Column(
          children: <Widget>[
            SearchInputComponent(),
            Consumer<IndexDataInfo>(builder: (context, provider, _) {
              if (provider.searchKeywords.length > 0) {
                return ListViewComponent();
              } else {
                return CardComponent();
              }
            })
          ]
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


//class IndexPage extends StatefulWidget {

//  Map arguments;
//  IndexPage({Key key, this.arguments}) : super(key: key);

//  @override
//  createState() =>
//      new _IndexPageState();
//    new _IndexPageState(arguments: this.arguments);
//}

//class _IndexPageState extends State<IndexPage> {
//  Map arguments;

//  _IndexPageState({
//    this.arguments
////  });

  // 构建首页容器
//  Widget _buildIndexContainer() {
//    return new Container(
//      color: Color(0xeeeeeeee),
//      child: new Column(
//        children: <Widget>[
//          SearchInputComponent(),
//          CardComponent()
//        ],
//      )
//    );
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('垃圾分类助手'),
//      ),
//      body: _buildIndexContainer(),
//    );
//  }
//}