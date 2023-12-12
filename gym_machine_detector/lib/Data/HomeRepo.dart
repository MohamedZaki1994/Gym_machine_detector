import 'dart:io';

import 'package:gym_machine_detector/Data/DataProvider.dart';

class HomeRepo {
  DataProvider _provider = DataProvider();

  Future<int> uploadImage(File file, String? url) async {
    return await _provider.uploadImage(file, url);
  }
}
