import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_widget_flutter/model/page.dart';

import '../../../data_source/data_source.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  QuranCubit get(context) => BlocProvider.of(context);

  Map<int, List<int>> selectedIndex = {};

  List<Page> pages = [];
  bool selected = false;

  int key = 0;
  dynamic verses = 1;

  handelList() {
    if (selectedIndex.isNotEmpty) {
      key = selectedIndex.keys.elementAt(0);
      verses = selectedIndex[0];
      emit(HandelSelectedListState());
    }
  }

  fetchPages({
    required int chapterId,
    required int bookId,
    required int narrationId,
  }) {
    emit(PagesFetchLoadingState());
    try {
      DataSource.instance
          .fetchPagesList(bookId: bookId, narrationId: 1, chapterId: chapterId)
          .then((value) async {
        print('Pages QuranCubit  $value');
        if (value != null) {
          pages = value;
          emit(PagesFetchedState(pages: pages));
        } else {
          emit(PagesFetchErrorState(error: 'No Data'));
        }
      }).onError((error, stackTrace) {
        emit(PagesFetchErrorState(error: 'OnError' + error.toString()));
      });
    } catch (e) {
      print(e.toString());
      emit(PagesFetchErrorState(error: 'CatchError' + e.toString()));
    }
  }

  onPress() {
    print(' Press Done');

    emit(OnPressState());
  }

  onLongPress(int index) {
    print('Long Press Done');
    selected = !selected;
    emit(OnLongPressState());
  }

  final List<String> quran = [
    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ  ١	',
    'ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ٣',
    'الحمد لله رب العالمين	',
    'الرحمن الرحيم	',
    'مالك يوم الدين	',
    'إياك نعبد وإياك نستعين	',
    'اهدنا الصراط المستقيم	',
    'صراط الذين أنعمت عليهم غير المغضوب عليهم ولا الضالين	'
  ];
}
