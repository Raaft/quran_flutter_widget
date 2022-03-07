import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_widget_flutter/quran_widget_flutter.dart';

import '../widgets/paint_point.dart';

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
              List pages  = cubit.pages;
              print(pages);
              return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: PageView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Image.network(
                          'https://www.researchgate.net/profile/Amirul-Ramzani-Radzid/publication/326224590/figure/fig1/AS:645292835753984@1530861209990/Example-of-text-image-Mushaf-Al-Quran-from-Mushaf-AlMadinah-Quran-Majeed-page-3.png',
                        ),
                        // Image.asset('assets/img/quranImg.jpg'),
                        paintPoint(offset1, offset2, () {}, () {}),

                        // Image.asset('assets/img/quranImg.jpg'),
                      ],
                    ),
                  ));
            }));
  }
}
