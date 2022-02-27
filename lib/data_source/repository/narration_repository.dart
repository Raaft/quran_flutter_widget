import 'package:quran_widget_flutter/data_source/local/local_data_source/narration_local_data_source.dart';
import 'package:quran_widget_flutter/data_source/remote/narration_api.dart';
import 'package:quran_widget_flutter/model/apis_response/my_response.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

class NarrationRepository {
  final NarrationLocalDataSource _narrationLocalDataSource =
      NarrationLocalDataSource();
  final NarrationApi _narrationApi = NarrationApi();

  Future<List<Narration>?> fetchNarrationsList() async {
    List<Narration>? narrationsList =
        await _narrationLocalDataSource.fetchNarrationsList();
    if ((narrationsList != null && narrationsList.isNotEmpty)) {
      return narrationsList;
    } else {
      final MyResponse<Narration> response =
          await _narrationApi.fetchNarrationsList();
      if (response.code == Apis.codeSUCCESS) {
        narrationsList = response.data as List<Narration>;
        _narrationLocalDataSource.saveNarrationsList(narrationsList);
      }
      return narrationsList;
    }
  }

  Future<Narration?> fetchNarrationById(int narrationId) async {
    Narration? narration =
        await _narrationLocalDataSource.fetchNarrationById(narrationId);
    if (narration != null) {
      return narration;
    } else {
      final MyResponse<Narration> response =
          await _narrationApi.fetchNarrationById(narrationId);
      if (response.code == Apis.codeSUCCESS) {
        narration = response.data as Narration?;
      }
      return narration;
    }
  }
}
