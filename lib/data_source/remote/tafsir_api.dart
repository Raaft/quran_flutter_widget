
import 'package:quran_widget_flutter/model/explanation_model.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';


class TafseerApi {
  Future<ExplanationModel?> fetchTafseerList() async {
    var response =
    await DioUtils.request(DioUtils.requestGET, Apis.fetchAllTAFSEER);
    if (response != null) {
      if (response.statusCode == 200) {
        return  ExplanationModel.fromJson(response.data);
      } else {
        return null;
      }
    }
    return null;
  }

}
