import 'package:flutter/material.dart';
import 'dart:io';
import './constants.dart';

class SoilScreen extends StatelessWidget {
  File image;
  String result;
  SoilScreen({this.image, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              'The Soil predicted is  $result',
              style: kstyle,
            ),
            SizedBox(
              height: 20.0,
            ),
            Image.file(image),
          ],
        ),
      ),
    ));
  }
}
