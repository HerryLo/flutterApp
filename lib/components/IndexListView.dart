import "package:flutter/material.dart";
import "package:provider/provider.dart";
import '../provider/indexPageProvider.dart';

FocusNode focusNode = FocusNode();

class ListViewComponent extends StatefulWidget {
  @override
  createState() => new _ListViewComponentState();
}

// 查询input 输入框组件
class _ListViewComponentState extends State<ListViewComponent> {
  final divider = Divider(
    color: Colors.grey[300],
    height: 1,
  );

  @override
  Widget build(BuildContext context) {
    var dataInfo = Provider.of<IndexDataInfo>(context);

    return Expanded(
        child: Stack(
          children: <Widget>[
            Scrollbar(
              child: ListView.separated(
                itemCount: dataInfo.searchKeywords.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      dataInfo.searchKeywords[index],
                    ),
                    onTap: () {
                      focusNode.unfocus();
                      print(dataInfo.searchKeywords[index]);
                      dataInfo.searchWast(dataInfo.searchKeywords[index]);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return divider;
                }
              )
            )
        ]
      )
    );
  }
}