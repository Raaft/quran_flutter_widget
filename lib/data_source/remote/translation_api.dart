
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

import '../../model/translation_model.dart';

class TranslationApi {
  Future<TranslationModel?> fetchTranslationList() async {
    var response =
    await DioUtils.request(DioUtils.requestGET, Apis.fetchAllTRANSLATION);
    if (response != null) {
      if (response.statusCode == 200) {
        return  TranslationModel.fromJson(response.data);
      } else {
        return null;
      }
    }
    return null;
  }

}
