import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile(String pathToFile) async {
    final path = await _localPath;
    return File('$path/pathFile');
  }

  Future<File?> readFile(String pathFile) async {
    try {
      return await _localFile(pathFile);
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  Future<File?> writeCounter(String pathFile, fileData) async {
    final file = await _localFile(pathFile);

    // Write the file
    return file.writeAsBytes(fileData);
  }
}
