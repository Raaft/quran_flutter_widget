import 'package:quran_widget_flutter/data_source/local/local_data_source/recitation_local_data_source.dart';
import 'package:quran_widget_flutter/data_source/remote/recitation_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class RecitationRepository {
  final RecitationLocalDataSource _recitationLocalDataSource =
      RecitationLocalDataSource();
  final RecitationApi _recitationApi = RecitationApi();

  Future<List<Recitation>?> fetchRecitationsList() async {
    List<Recitation>? recitationsList =
        await _recitationLocalDataSource.fetchRecitationsList();
    if ((recitationsList != null && recitationsList.isNotEmpty)) {
      return recitationsList;
    } else {
      final MyResponse<Recitation> response =
          await _recitationApi.fetchRecitationsList();
      if (response.code == Apis.codeSUCCESS) {
        recitationsList = response.data as List<Recitation>;
        _recitationLocalDataSource.saveRecitationsList(recitationsList);
      }
      return recitationsList;
    }
  }

  Future<Recitation?> fetchRecitationById(int recitationId) async {
    Recitation? recitation =
        await _recitationLocalDataSource.fetchRecitationById(recitationId);
    if (recitation != null) {
      return recitation;
    } else {
      final MyResponse<Recitation> response =
          await _recitationApi.fetchRecitationById(recitationId);
      if (response.code == Apis.codeSUCCESS) {
        recitation = response.data as Recitation?;
      }
      return recitation;
    }
  }
}
