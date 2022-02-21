import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';
import 'package:quran_widget_flutter/network_helper/dio_utils.dart';

class RecitationVersesApi{

  Future<MyResponse<RecitationVerses>> fetchRecitationVersesList(int recitationId) async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_RECITATIONS}{$recitationId}/verses/");
    if (response.statusCode == 200) {
      return MyResponse<RecitationVerses>.fromJson(response.data,Apis.LIST);
    } else {
      return MyResponse<RecitationVerses>.init(Apis.CODE_ERROR, null, null);
    }
  }

  Future<MyResponse<RecitationVerses>> fetchRecitationVersesById(int recitationId,int recitationVersesId) async {
    var response = await DioUtils.request(DioUtils.REQUEST_GET, "${Apis.FETCH_ALL_RECITATIONS}{$recitationId}/verses/$recitationVersesId");
    if (response.statusCode == 200) {
      return MyResponse<RecitationVerses>.fromJson(response.data,Apis.SINGLE);
    } else {
      return MyResponse<RecitationVerses>.init(Apis.CODE_ERROR, null, null);
    }
  }
}
