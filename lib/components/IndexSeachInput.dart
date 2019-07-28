import "package:flutter/material.dart";
import "package:provider/provider.dart";
import '../provider/indexPageProvider.dart';

FocusNode focusNode = FocusNode();

class SearchInputComponent extends StatefulWidget {
  @override
  createState() => new _SearchInputComponentState();
}

// 查询input 输入框组件
class _SearchInputComponentState extends State<SearchInputComponent> {
  final TextEditingController _controller = TextEditingController();

  String inputValue = '';

  Widget _buildInput() {
    var dataInfo = Provider.of<IndexDataInfo>(context);
    return new TextField(
      onChanged: (value) {
        if(_controller.text.isNotEmpty) {
          dataInfo.setInputValue(value);
        }
      },
      focusNode: focusNode,
      controller: _controller,
      textInputAction: TextInputAction.search,
      decoration: new InputDecoration(
        hintText: '输入垃圾名称',
        border: InputBorder.none,
        icon: Icon(
          Icons.search,
        ),
        suffixIcon: _controller.text.isNotEmpty ?
        GestureDetector(
          child: Icon(
            Icons.clear
          ),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback(
                    (_) => _controller.clear());
            dataInfo.clearInputValue('');
          }
        ) : null,
      ),
      autocorrect: false,
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