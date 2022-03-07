import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File?> _createFile(String savePath) async {
    String temp = await _localPath;

    File? file;

    try {
      file = File(temp + savePath);
      file = await file.create();
    } catch (e) {
      print('createFile Error  ' + e.toString());
    }
    return file;
  }

  var dio = Dio();

  Future<File?> download2(String url, String savePath,
      Function(int, int) showDownloadProgress) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );

      print(response.headers);

      var file = await _createFile(savePath);

      var raf = file!.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      print('error ' + e.toString());
    }
    return null;
  }
}


/**
 *  static Future<String> get _localPath async {
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
 */