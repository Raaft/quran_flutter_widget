import 'dart:async';
import 'dart:convert' show base64, utf8;

import 'package:dio/dio.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/plugin_aut/auth_plugin_model.dart';

class QuranWidgetInit {
  static Dio dio = Dio();

  static init({required String clientId, required String clientSecret}) async {
    Apis.clientId = clientId;
    Apis.clientSecret = clientSecret;

    String auth = '$clientId:$clientSecret';
    String encoded = base64.encode(utf8.encode(auth));

    print('code is $encoded');
    dio = Dio(BaseOptions(
      baseUrl: 'http://165.232.114.22',
      receiveDataWhenStatusError: true,
      headers: {
        'Authorization': 'Basic $encoded',
        'Cache-Control': ' no-cache',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    ));

    await postData().then((value) {
      var val = AuthPluginModel.fromJson(value.data);
      Apis.authorization = '${val.tokenType} ${val.accessToken}';
      print(' Authorization = ${Apis.authorization}');
    });
  }

  static Future<Response> postData() async {
    //dio.options.headers = {};

    return await dio.post('/o/token/', data: 'grant_type=client_credentials');
  }
}
