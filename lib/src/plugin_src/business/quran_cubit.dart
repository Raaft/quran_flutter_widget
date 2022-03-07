import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data_source/data_source.dart';
import '../../../model/page.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  QuranCubit get(context) => BlocProvider.of(context);

  List<Page> pages = [];

  fetchPages() {
    try {
      DataSource.instance.fetchPagesList().then((value) async {
        if (value!.isNotEmpty) {
          pages = value;
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
}
