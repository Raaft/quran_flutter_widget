import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/reciter.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class ReciterApi{

  Future<MyResponse<Reciter>> fetchRecitersList() async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, Apis.FETCH_ALL_RECITERS);
    if (response.statusCode == 200) {
      return MyResponse<Reciter>.fromJson(response.data,Apis.LIST);
    } else {
      return MyResponse<Reciter>.init(Apis.CODE_ERROR, null, null);
    }
  }


  Future<MyResponse<Reciter>> fetchReciterById(int reciterId) async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_RECITERS}$reciterId");
    if (response.statusCode == 200) {
      return MyResponse<Reciter>.fromJson(response.data,Apis.SINGLE);
    } else {
      return MyResponse<Reciter>.init(Apis.CODE_ERROR, null, null);
    }
  }

}