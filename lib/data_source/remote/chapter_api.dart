import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class ChapterApi {
  Future<MyResponse<Chapter>> fetchChaptersList() async {
    var response =
        await DioUtils.request(DioUtils.REQUEST_GET, Apis.FETCH_ALL_CHAPTERS);
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Chapter>.fromJson(response.data, Apis.LIST);
      } else {
        return MyResponse<Chapter>.init(Apis.CODE_ERROR, null, null);
      }
    } else {
      return MyResponse<Chapter>.init(Apis.CODE_ERROR, null, null);
    }
  }

  Future<MyResponse<Chapter>> fetchChapterById(int chapterId) async {
    var response = await DioUtils.request(
        DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_CHAPTERS}$chapterId");
    if (response != null) {
      if (response.statusCode == 200) {
        return MyResponse<Chapter>.fromJson(response.data, Apis.SINGLE);
      } else {
        return MyResponse<Chapter>.init(Apis.CODE_ERROR, null, null);
      }
    } else {
      return MyResponse<Chapter>.init(Apis.CODE_ERROR, null, null);
    }
  }
}
