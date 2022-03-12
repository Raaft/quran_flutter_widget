import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_widget_flutter/model/page.dart' as objectPaoge;

import 'package:quran_widget_flutter/src/plugin_src/business/quran_cubit.dart';
import 'package:quran_widget_flutter/src/plugin_src/data/models/page_type.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/quran_page.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/tafsir_page.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/tajwid_page.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/translation_page.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({
    Key? key,
    required this.page,
    required this.chapterId,
    required this.bookId,
    required this.narrationId,
    required this.onTap,
    required this.onLongTap,
    required this.getPage,
  }) : super(key: key);

  final PageType page;
  final int chapterId;
  final int bookId;
  final int narrationId;

  final Function(String data) onTap;
  final Function(String data) onLongTap;
  final Function(objectPaoge.Page data) getPage;

  @override
  Widget build(BuildContext context) {
    // print('Chapter Page $chapterId');
    return BlocProvider(
      create: (context) => QuranCubit()
        ..fetchPages(
            chapterId: chapterId, bookId: bookId, narrationId: narrationId),
      child: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          print(page.toString());
        },
        builder: (context, state) {
          var cubit = QuranCubit().get(context);
          return body(cubit, page);
        },
      ),
    );
  }

  Widget body(QuranCubit cubit, PageType page) {
    switch (page) {
      case PageType.quran:
        {
          return QuranPage(
            onTap: onTap,
            onLongTap: onLongTap,
            cubit: cubit,
            getPage: getPage,
          );
        }

      case PageType.tafsir:
        {
          return const TafsirPage();
        }
      case PageType.tajwid:
        {
          return const TajwidPage();
        }
      case PageType.translation:
        {
          return const TranslationPage();
        }

      default:
        {
          return QuranPage(
            onTap: onTap,
            onLongTap: onLongTap,
            cubit: cubit,
            getPage: getPage,
          );
        }
    }
  }
}
