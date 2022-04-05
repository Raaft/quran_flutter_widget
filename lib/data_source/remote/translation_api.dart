
import 'package:dio/dio.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

import '../../model/apis_response/my_response.dart';
import '../../model/translation_model.dart';

class TranslationApi {


  Future<List<TranslationModel>?> fetchTranslationList() async {
    Response? response =
    await DioUtils.request(DioUtils.requestGET, Apis.fetchAllTRANSLATION);
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<TranslationModel>.fromJson(response.data, Apis.list,) as List<TranslationModel>;
      } else {
        return MyResponse<TranslationModel>.init(Apis.codeERROR, null, null)as List<TranslationModel>;
      }
    }
    return null;
  }


}
