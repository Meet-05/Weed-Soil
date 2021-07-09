import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../services/api.dart';
import '../constants.dart';
import '../soil_screen.dart';
import '../weed_screen.dart';

class Option extends StatefulWidget {
  Function toggleFunction;
  typeOfAction actionType;
  Option({this.actionType, this.toggleFunction});
  @override
  _OptionState createState() => _OptionState();
}

enum imageSourceSelected { gallery, camera }

class _OptionState extends State<Option> {
  File _imageFile;

  Future selectImage(imageSourceSelected source) async {
    final picker = ImagePicker();
    var image;
    if (source == imageSourceSelected.camera) {
      image = await picker.getImage(source: ImageSource.camera, maxHeight: 300);
    } else if (source == imageSourceSelected.gallery) {
      image =
          await picker.getImage(source: ImageSource.gallery, maxHeight: 300);
    }
    setState(() {
      _imageFile = File(image.path);
      print(_imageFile.path);
    });
    if (widget.actionType == typeOfAction.soil) {
      widget.toggleFunction();
      String result = await uploadImage(_imageFile, typeOfAction.soil);
      Navigator.pop(context);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SoilScreen(
                    image: _imageFile,
                    result: result,
                  )));
      widget.toggleFunction();
    } else {
      widget.toggleFunction();

      String result = await uploadImage(_imageFile, typeOfAction.weed);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeedScreen(
                    imageUrl: result,
                  )));
      widget.toggleFunction();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0))),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  selectImage(imageSourceSelected.camera);
                },
                child: Text(
                  'From Camera',
                  style: kstyle,
                )),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
                onPressed: () {
                  selectImage(imageSourceSelected.gallery);
                },
                child: Text(
                  'From Gallery',
                  style: kstyle,
                )),
          ],
        ),
      ),
    );
  }
}
