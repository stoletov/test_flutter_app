import 'package:flutter/material.dart';
import 'package:testflutterapp/common/resources/app_resurces.dart';
import 'package:testflutterapp/data/models/card.dart';

class CardDetailsView extends StatefulWidget {
  final String name;
  final String type;

  CardDetailsView({ this.name, this.type });

  @override
  _CardDetailsViewState createState() => _CardDetailsViewState();
}

class _CardDetailsViewState extends State<CardDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(widget.name, style: TextStyle(fontSize: 26, color: Colors.black),),
        backgroundColor: AppColors.grayBarColor,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.name, style: TextStyle(fontSize: 26, color: Colors.black),),
              Text(widget.type, style: TextStyle(fontSize: 26, color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }

}