import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/page_type.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  static QuranCubit get(context) => BlocProvider.of(context);

  PageType pageType=PageType.tafsir;

  ChangePage({required PageType page}){
    pageType=page;
    emit(ChangePageState());
  }



}
