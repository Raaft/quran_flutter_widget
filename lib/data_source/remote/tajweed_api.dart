import 'package:dio/dio.dart';
import 'package:quran_widget_flutter/model/tajweed_model.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

import '../../model/apis_response/my_response.dart';

class TajweedApi {







  Future<List<TajweedModel>?> fetchTajweedList() async {
    Response? response =
    await DioUtils.request(DioUtils.requestGET, Apis.fetchAllTAJWEED);
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<TajweedModel>.fromJson(response.data, Apis.list,) as List<TajweedModel>;
      } else {
        return MyResponse<TajweedModel>.init(Apis.codeERROR, null, null)as List<TajweedModel>;
      }
    }
    return null;
  }





}


