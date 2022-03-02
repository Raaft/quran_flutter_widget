import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/page_type.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  QuranCubit get(context) => BlocProvider.of(context);

  PageType? pageType;

  ChangePage({required PageType page}) {
    print('page type = $page');
    pageType = page;
    emit(ChangePageState());
  }
}
