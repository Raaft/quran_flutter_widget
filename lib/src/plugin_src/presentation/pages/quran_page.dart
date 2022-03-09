import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_widget_flutter/helper/q.dart';
import 'package:quran_widget_flutter/model/verse.dart';
import 'package:quran_widget_flutter/quran_widget_flutter.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  final offset1 = const Offset(50, 400);
  final offset2 = const Offset(200, 400);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => QuranCubit(),
        child: BlocConsumer<QuranCubit, QuranState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = QuranCubit().get(context);
              List<Verse>? verses = cubit.verses;
              print('verses ' + verses.toString());

              return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        if ((state is PagesFetchedState))
                          Text('PagesFetchedState'),
                        if ((state is PagesFetchLoadingState))
                          Text('PagesFetchLoadingState'),
                        if ((state is PagesFetchErrorState))
                          Text('PagesFetchErrorState'),
                        (state is PagesFetchLoadingState)
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: verses.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onLongPress: () {},
                                  onTap: () {},
                                  child: Text(
                                      verses[index].uthmanicText.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: Q.qaloon),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                        // Image.asset('assets/img/quranImg.jpg'),
                      ],
                    ),
                  ));
            }));
  }
}
