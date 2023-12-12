import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class DataProvider {
  Future<int> uploadImage(File file, String? urlString) async {
    //
    List<int> imageBytes = await file.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    //
    // ByteData dataByte = await rootBundle.load('assets/icons/back.jpg');
    // List<int> bytes = dataByte.buffer.asUint8List();

    // final habal = Uint8List.fromList(bytes);
    // String base64Image = base64Encode(habal);

    final postUrl = urlString ??
        'https://33a6-2001-16a2-f91f-5200-b888-25cd-47fd-a540.ngrok-free.app/predict';
    final data = {'image': base64Image};

    final headers = {
      'content-type': 'application/json',
    };

    try {
      BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 3000),
        headers: headers,
      );
      final response = await Dio(options).post(postUrl, data: data);

      if (response.statusCode == 200) {
        print('Tmam');
        return response.data['class_of_instance_0'];
      } else {
        print('notification sending failed');
        return 1000;
      }
    } catch (e) {
      print('exception $e');
      return 1000;
    }
  }
}
