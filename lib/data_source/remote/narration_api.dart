import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class NarrationApi {
  Future<MyResponse<Narration>> fetchNarrationsList() async {
    var response =
        await DioUtils.request(DioUtils.REQUEST_GET, Apis.FETCH_ALL_NARRATIONS);
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Narration>.fromJson(response.data, Apis.LIST);
      } else {
        return MyResponse<Narration>.init(Apis.CODE_ERROR, null, null);
      }
    } else {
      return MyResponse<Narration>.init(Apis.CODE_ERROR, null, null);
    }
  }

  Future<MyResponse<Narration>> fetchNarrationById(int narrationId) async {
    var response = await DioUtils.request(
        DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_NARRATIONS}$narrationId");
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Narration>.fromJson(response.data, Apis.SINGLE);
      } else {
        return MyResponse<Narration>.init(Apis.CODE_ERROR, null, null);
      }
    } else {
      return MyResponse<Narration>.init(Apis.CODE_ERROR, null, null);
    }
  }
}
