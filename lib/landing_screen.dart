import 'package:flutter/material.dart';
import './widgets/option.dart';
import './constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = false;
  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void handleTap(typeOfAction action) {
    showModalBottomSheet(
        context: context,
        builder: (context) =>
            Option(actionType: action, toggleFunction: toggleLoading));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('Identify Weed', () {
                handleTap(typeOfAction.weed);
              }),
              SizedBox(
                height: 40.0,
              ),
              buildButton('Predict Soil', () {
                handleTap(typeOfAction.soil);
              }),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton buildButton(String name, Function onTap) {
    return MaterialButton(
      shape: StadiumBorder(),
      elevation: 5.0,
      color: Colors.blue,
      padding: EdgeInsets.all(20.0),
      onPressed: onTap,
      child: Text(name, style: kstyle),
    );
  }
}
