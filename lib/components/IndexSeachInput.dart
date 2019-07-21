import "package:flutter/material.dart";

//import '../provider/indexPage.pro.dart';

FocusNode focusNode = FocusNode();

// index input Component
class SearchInputComponent extends StatefulWidget {
  @override
  createState() => new _SearchInputComponentState();
}

class _SearchInputComponentState extends State<SearchInputComponent> {
  final TextEditingController _controller = TextEditingController();

  Widget _buildInput() {
    return new TextField(
      focusNode: focusNode,
      controller: _controller,
      textInputAction: TextInputAction.search,
      decoration: new InputDecoration(
        hintText: '输入垃圾名称',
        border: InputBorder.none,
        icon: Icon(
          Icons.search,
        ),
        suffixIcon: GestureDetector(
          child: Container(
            child: Icon(Icons.clear),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: EdgeInsets.only(left: 14.0, right: 14.0),
          child: _buildInput(),
        )
    );
  }
}