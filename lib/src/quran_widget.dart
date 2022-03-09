import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  }) : super(key: key);

  final PageType page;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(),
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
}

Widget body(QuranCubit cubit, PageType page) {
  switch (page) {
    case PageType.quran:
      {
        return  QuranPage();
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
        return  QuranPage();
      }
  }
}
