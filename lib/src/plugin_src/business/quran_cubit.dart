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

  late final int chapterId;
  late final int bookId;
  late final int narrationId;

  fetchPages({
    required int chapterId,
    required int bookId,
    required int narrationId,
  }) {
    this.chapterId = chapterId;
    this.bookId = bookId;
    this.narrationId = narrationId;
    emit(PagesFetchLoadingState());
    try {
      DataSource.instance
          .fetchPagesList(
              bookId: bookId, narrationId: narrationId, chapterId: chapterId)
          .then((value) async {
        print('Pages QuranCubit  $value');
        if (value != null) {
          pages = value;
          emit(PagesFetchedState(pages: pages));
        } else {
          emit(PagesFetchErrorState(error: 'No Data'));
        }
      }); /*.onError((error, stackTrace) {
        emit(PagesFetchErrorState(error: 'OnError ' + error.toString()));
      });*/
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

  void changePage(int index, int sizePage, int chapterId) {
    if (index < 2) {
      try {
        DataSource.instance
            .fetchPagesList(
                bookId: bookId,
                narrationId: narrationId,
                chapterId: chapterId + 1)
            .then((value) async {
          print('Pages QuranCubit  $value');
          if (value != null) {
            var temp = pages;
            pages = value;
            pages.addAll(temp);
            emit(PagesFetchedState(pages: pages));
          } else {
            emit(PagesFetchErrorState(error: 'No Data'));
          }
        });
      } catch (e) {
        print(e.toString());
        emit(PagesFetchErrorState(error: 'CatchError' + e.toString()));
      }
    } else if (index - sizePage < 3) {
      try {
        DataSource.instance
            .fetchPagesList(
                bookId: bookId,
                narrationId: narrationId,
                chapterId: chapterId + 1)
            .then((value) async {
          print('Pages QuranCubit  $value');
          if (value != null) {
            pages.addAll(value);
            emit(PagesFetchedState(pages: pages));
          } else {
            emit(PagesFetchErrorState(error: 'No Data'));
          }
        });
      } catch (e) {
        print(e.toString());
        emit(PagesFetchErrorState(error: 'CatchError' + e.toString()));
      }
    }
  }
}
