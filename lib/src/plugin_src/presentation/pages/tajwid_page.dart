import 'package:flutter/material.dart';

import '../widgets/point_widget.dart';

class TajwidPage extends StatelessWidget {
  const TajwidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
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
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                      ' fear your Lord, who created you from one soul and created from it its mate and dispersed from both of them many men and women. And fear Allah',
                      style: TextStyle(color: Colors.blue,fontSize: 20)),
                ],
              ),

              CustomPaint(
                painter: OpenPainter(offset: Offset(20,205)),
              ),
            ],
          ),
        ));
  }
}
