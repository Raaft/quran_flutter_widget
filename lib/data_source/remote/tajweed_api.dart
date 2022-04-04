import 'package:quran_widget_flutter/model/explanation_model.dart';
import 'package:quran_widget_flutter/model/tajweed_model.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class TajweedApi {
  Future<TajweedModel?> fetchTajweedList() async {
    var response =
        await DioUtils.request(DioUtils.requestGET, Apis.fetchAllTAJWEED);
    if (response != null) {
      if (response.statusCode == 200) {
        return TajweedModel.fromJson(response.data);
      } else {
        return null;
      }
    }
    return null;
  }
}
