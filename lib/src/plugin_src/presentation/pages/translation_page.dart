import 'package:flutter/material.dart';

import '../widgets/paint_point.dart';

class TranslationPage extends StatelessWidget {
  const TranslationPage({Key? key}) : super(key: key);

  final offset1 = const Offset(50, 200);
  final offset2 = const Offset(50, 300);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://df61994948e9a54a5259-ad04094bac72ed4d481dba65a1920e88.ssl.cf1.rackcdn.com/4_1.png',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                      ' fear your Lord, who created you from one soul and created from it its mate and dispersed from both of them many men and women. And fear Allah',
                      style:  TextStyle(color: Colors.blue,fontSize: 20)),
                ],
              ),

              paintPoint(offset1,offset2,(){},(){}),
            ],
          ),
        ));
  }
}

