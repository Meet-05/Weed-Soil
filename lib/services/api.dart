import 'package:dio/dio.dart';
import 'dart:io';
import '../constants.dart';

var dio = Dio();

Future<String> uploadImage(File file, typeOfAction action) async {
  print('-----${file.path}');
  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(file.path, filename: fileName),
  });
  var response;
  try {
    if (action == typeOfAction.soil) {
      //https://soil-pred.herokuapp.com/soil
      //http://10.0.2.2:5000/soil
      response = await dio.post("https://soil-pred.herokuapp.com/soil",
          data: formData);
    } else {
      //https://salty-dawn-81913.herokuapp.com/weed
      response = await dio.post("https://salty-dawn-81913.herokuapp.com/weed",
          data: formData);
    }
    print('req completed');
    print(response.data['result']);
    return response.data['result'];
  } catch (e) {
    print(e);
  }
}
