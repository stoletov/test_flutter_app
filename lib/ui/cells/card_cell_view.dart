import 'package:flutter/material.dart';
import 'package:testflutterapp/common/resources/app_resurces.dart';


class CardsCellView extends StatelessWidget {
  final int index;
  final String name;
  final String type;
  final ValueChanged<int> onPush;

  CardsCellView({
    Key key,
    @required this.index,
    @required this.name,
    @required this.type,
    this.onPush
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2;
    return Stack(
      children: <Widget>[
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.grayCellColor
          ) ,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Stack(children: <Widget>[
              Positioned(
                bottom: 27,
                left: 5,
                right: 5,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                bottom: 7,
                left: 5,
                right: 5,
                child: Text(
                  type,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                ),
              )
            ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            child: InkWell(onTap: () => onPush(index),
              borderRadius: BorderRadius.circular(10),),
            color: Colors.transparent,
          ),
        )
      ],
    );
  }


}