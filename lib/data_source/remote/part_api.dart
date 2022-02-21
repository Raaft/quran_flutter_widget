import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class PartApi{

  Future<MyResponse<Part>> fetchPartsList() async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, Apis.FETCH_ALL_PARTS);
    if (response.statusCode == 200) {
      return MyResponse<Part>.fromJson(response.data,Apis.LIST);
    } else {
      return MyResponse<Part>.init(Apis.CODE_ERROR, null, null);
    }
  }

  Future<MyResponse<Part>> fetchPartById(int partId) async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_PARTS}$partId");
    if (response.statusCode == 200) {
      return MyResponse<Part>.fromJson(response.data,Apis.SINGLE);
    } else {
      return MyResponse<Part>.init(Apis.CODE_ERROR, null, null);
    }
  }
}