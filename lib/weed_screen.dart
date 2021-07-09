import 'package:flutter/material.dart';
import './constants.dart';

class WeedScreen extends StatelessWidget {
  String imageUrl;
  WeedScreen({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Result',
                style: kstyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.network(
                imageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
