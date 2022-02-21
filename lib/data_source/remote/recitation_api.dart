import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class RecitationApi{

  Future<MyResponse<Recitation>> fetchRecitationsList() async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, Apis.FETCH_ALL_RECITATIONS);
    if (response.statusCode == 200) {
      return MyResponse<Recitation>.fromJson(response.data,Apis.LIST);
    } else {
      return MyResponse<Recitation>.init(Apis.CODE_ERROR, null, null);
    }
  }

  Future<MyResponse<Recitation>> fetchRecitationById(int recitationId) async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_RECITATIONS}$recitationId");
    if (response.statusCode == 200) {
      return MyResponse<Recitation>.fromJson(response.data,Apis.SINGLE);
    } else {
      return MyResponse<Recitation>.init(Apis.CODE_ERROR, null, null);
    }
  }

}