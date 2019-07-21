import 'package:flutter/material.dart';

// index card Component
class CardComponent extends StatelessWidget {

  final _wasts = [
    "assets/ico-1.jpg",
    "assets/ico-2.jpg",
    "assets/ico-3.jpg",
    "assets/ico-4.jpg"
  ];

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
              ),
              itemCount: _wasts.length,
              itemBuilder: (context, index) {
                return CardCell(_wasts[index]);
              })
      ),
    );
  }
}


class CardCell extends StatelessWidget {

  final wast;
  CardCell(this.wast);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
          Container(
            height: 100,
            width: 100,
            child: Image.asset(
              wast
            ),
        )
      ],
    );
  }
}