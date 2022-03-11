import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_widget_flutter/model/page.dart';

import '../../../data_source/data_source.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  QuranCubit get(context) => BlocProvider.of(context);

  List<Page> pages = [];

  fetchPages() {
    emit(PagesFetchLoadingState());
    try {
      DataSource.instance
          .fetchPagesList(bookId: 1, narrationId: 1)
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

  onLongPress() {
    print('Long Press Done');
    emit(onLongPress());
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
