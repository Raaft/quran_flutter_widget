import 'package:flutter/material.dart';

import '../widgets/point_widget.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Stack(
            children: [
              Image.network(
                'https://www.researchgate.net/profile/Amirul-Ramzani-Radzid/publication/326224590/figure/fig1/AS:645292835753984@1530861209990/Example-of-text-image-Mushaf-Al-Quran-from-Mushaf-AlMadinah-Quran-Majeed-page-3.png',
              ),
              // Image.asset('assets/img/quranImg.jpg'),
              CustomPaint(
                painter: OpenPainter(
                  offset: Offset(20, 65),
                ),
              ),
            ],
          ),
        ));
  }
}
