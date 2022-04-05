
import 'package:dio/dio.dart';
import 'package:quran_widget_flutter/model/explanation_model.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

import '../../model/apis_response/my_response.dart';


class TafseerApi {


  Future<List<ExplanationModel>?> fetchTafseerList() async {
    Response? response =
    await DioUtils.request(DioUtils.requestGET, Apis.fetchAllTAFSEER);
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<ExplanationModel>.fromJson(response.data, Apis.list,) as List<ExplanationModel>;
      } else {
        return MyResponse<ExplanationModel>.init(Apis.codeERROR, null, null)as List<ExplanationModel>;
      }
    }
    return null;
  }


}
