import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';

class FileStorage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  // static get _httpClient => HttpClient();

  static Future<File> _localFile(String pathToFile) async {
    final path = await _localPath;
    return File('$path/pathFile');
  }

  static Future<File?> readFile(String pathFile) async {
    try {
      return await _localFile(pathFile);
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  static Future<File?> writeCounter(String pathFile, String uri) async {
    final file = await _localFile(pathFile);

    //var requset = await _httpClient.getUri(uri);
    //var response = await requset.close();
    //Uint8List bytes = await consolidateHttpClientResponseBytes(response);

    var dio = Dio();

    Uri data = Uri.file(uri);

    Response<Uint8List> bytes = await dio.getUri<Uint8List>(data);

    // Write the file
    return file.writeAsBytes(bytes.data!);
  }
}
