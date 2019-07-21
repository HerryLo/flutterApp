import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {

  final _wasts = [
    "lib/assets/ico-1.png",
    "lib/assets/ico-2.png",
    "lib/assets/ico-3.png",
    "lib/assets/ico-4.png"
  ];

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
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
    print(wast);
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      padding: const EdgeInsets.all(12.0),
      onPressed: () {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Image.asset(
                  wast,
                  height: 100,
                  width: 100
                ),
                padding: EdgeInsets.all(8)
              )
            ],
          )
        ],
      ),
      color: Colors.white,
    );
  }
}