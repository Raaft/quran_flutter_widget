import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class NarrationApi {
  Future<MyResponse<Narration>> fetchNarrationsList({String? qurey}) async {
    var response = await DioUtils.request(
      DioUtils.requestGET,
      Apis.fetchAllNARRATIONS,
      queryParameters: {'q': qurey},
    );
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Narration>.fromJson(response.data, Apis.list,
            code: response.statusCode);
      } else {
        return MyResponse<Narration>.init(Apis.codeERROR, null, null);
      }
    } else {
      return MyResponse<Narration>.init(Apis.codeERROR, null, null);
    }
  }

  Future<MyResponse<Narration>> fetchNarrationById(int narrationId) async {
    var response = await DioUtils.request(
        DioUtils.requestGET, '${Apis.fetchAllNARRATIONS}$narrationId');
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Narration>.fromJson(response.data, Apis.single);
      } else {
        return MyResponse<Narration>.init(Apis.codeERROR, null, null);
      }
    } else {
      return MyResponse<Narration>.init(Apis.codeERROR, null, null);
    }
  }
}
