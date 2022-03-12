import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;

import '../../../../helper/q.dart';
import '../../../../quran_widget_flutter.dart';
import '../widgets/paint_point.dart';

class TranslationPage extends StatelessWidget {
  const TranslationPage({Key? key}) : super(key: key);

  final offset1 = const Offset(50, 200);
  final offset2 = const Offset(50, 300);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        var cubit = QuranCubit().get(context);
        cubit.handelList();
        List<page.Page> pages = cubit.pages;


        return Container(
            padding: const EdgeInsets.all(20),
            child: PageView.builder(
              itemCount: (cubit.selectedIndex.isEmpty) ? cubit.verses : cubit
                  .verses.length,
              itemBuilder: (context, index) =>
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Image.network(
                    'https://df61994948e9a54a5259-ad04094bac72ed4d481dba65a1920e88.ssl.cf1.rackcdn.com/4_1.png',
                  ),*/

                          Text(
                            pages[cubit.key].verses![(cubit.selectedIndex
                                .isNotEmpty) ? cubit.verses[index] : cubit
                                .verses].uthmanicText
                                .toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: Q.hafs15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(' THis is Translation for this Page ',
                              style: TextStyle(
                                  color: Colors.blue.shade700, fontSize: 20)),
                        ],
                      ),

                      ///  paintPoint(offset1, offset2, () {}, () {}),
                    ],
                  ),
            ));
      },
    );
  }
}

