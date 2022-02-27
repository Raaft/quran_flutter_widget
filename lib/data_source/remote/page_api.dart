import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class PageApi {
  Future<MyResponse<Page>> fetchPagesList() async {
    var response =
        await DioUtils.request(DioUtils.requestGET, Apis.fetchAllPAGES);
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Page>.fromJson(response.data, Apis.list);
      } else {
        return MyResponse<Page>.init(Apis.codeERROR, null, null);
      }
    } else {
      return MyResponse<Page>.init(Apis.codeERROR, null, null);
    }
  }

  Future<MyResponse<Page>> fetchPageById(int pageId) async {
    var response = await DioUtils.request(
        DioUtils.requestGET, '${Apis.fetchAllPAGES}$pageId');
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Page>.fromJson(response.data, Apis.single);
      } else {
        return MyResponse<Page>.init(Apis.codeERROR, null, null);
      }
    } else {
      return MyResponse<Page>.init(Apis.codeERROR, null, null);
    }
  }
}
