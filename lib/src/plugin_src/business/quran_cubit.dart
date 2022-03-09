import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_widget_flutter/model/verse.dart';

import '../../../data_source/data_source.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  QuranCubit get(context) => BlocProvider.of(context);

  List<Verse> verses = [];

  fetchPages() {
    emit(PagesFetchLoadingState());
    try {
      DataSource.instance.fetchPagesList().then((value) async {
        print('Pages $value');
        if (value != null && value.isNotEmpty) {
          for (var element in value) {
            if (element.verses != null && element.verses!.isNotEmpty) {
              verses = element.verses!;
              break;
            }
          }
          emit(PagesFetchedState());
        } else {
          emit(PagesFetchErrorState());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(PagesFetchErrorState());
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
