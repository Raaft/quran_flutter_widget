part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}

class PagesFetchLoadingState extends QuranState {}

class PagesFetchedState extends QuranState {
  final List<Page> pages;
  PagesFetchedState({
    required this.pages,
  });
}

class PagesFetchErrorState extends QuranState {
  final String error;
  PagesFetchErrorState({
    required this.error,
  });
}

class OnPressState extends QuranState {}

class OnLongPressState extends QuranState {}
class HandelSelectedListState extends QuranState {}
