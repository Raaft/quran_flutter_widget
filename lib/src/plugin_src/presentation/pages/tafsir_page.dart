import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_widget_flutter/quran_widget_flutter.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;

class TafsirPage extends StatefulWidget {
  const TafsirPage({
    Key? key,
    this.onTap,
    this.onLongTap,
    required this.cubit,
  }) : super(key: key);
  final Function(String data, bool isVerseSelected)? onTap;
  final Function(String data, bool isVerseSelected)? onLongTap;
  final QuranCubit cubit;

  @override
  State<TafsirPage> createState() => _TafsirPageState();
}

class _TafsirPageState extends State<TafsirPage> {
  final offset1 = const Offset(50, 200);

  final offset2 = const Offset(50, 300);

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        BlocProvider.of<QuranCubit>(context).handelList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        var cubit = QuranCubit().get(context);
        cubit.handelList();
        List<page.Page> pages = cubit.pages;
        cubit.handelList();
        return Container(
            padding: const EdgeInsets.all(20),
            child: PageView.builder(
              itemCount: (cubit.selectedIndex.isEmpty)
                  ? cubit.verses
                  : cubit.verses.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*Image.network(
                    'https://df61994948e9a54a5259-ad04094bac72ed4d481dba65a1920e88.ssl.cf1.rackcdn.com/4_1.png',
                  ),*/

                      GestureDetector(
                        onTap: () {
                          //  widget.onTap('',cubit.selectedIndex.isNotEmpty);
                        },
                        child: Image.network(
                          'https://df61994948e9a54a5259-ad04094bac72ed4d481dba65a1920e88.ssl.cf1.rackcdn.com/4_1.png',
                        ),

                        /*  Text(
                          pages[1]
                              .verses![1]
                              .uthmanicText
                              .toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: Q.hafs15,
                          ),
                          textAlign: TextAlign.start,
                        ),*/
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(' THis is tafsir for this Page ',
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
