import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
//import 'package:flutter/services.dart';

class PDFApi {
  static Future<File> loadNetWork(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, Uint8List bytes) async {
    final fileName = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
