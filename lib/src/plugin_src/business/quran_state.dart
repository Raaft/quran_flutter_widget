part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class PagesFetchedState extends QuranState {}
class PagesFetchErrorState extends QuranState {}