import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_widget_flutter/src/plugin_src/business/quran_cubit.dart';
import 'package:quran_widget_flutter/src/plugin_src/data/models/page_type.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/quran_page.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/tafsir_page.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/tajwid_page.dart';
import 'package:quran_widget_flutter/src/plugin_src/presentation/pages/translation_page.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(),
      child: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = QuranCubit.get(context);

          switch (cubit.pageType) {
            case PageType.quran:
              {
                return QuranPage();
              }

            case PageType.tafsir:
              {
                return TafsirPage();
              }
            case PageType.tajwid:
              {
                return TajwidPage();
              }
            case PageType.translation:
              {
                return TranslationPage();
              }

            default:
              {
                return QuranPage();
              }
          }
          ;
        },
      ),
    );
  }
}
