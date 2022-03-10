import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_widget_flutter/helper/q.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;
import 'package:quran_widget_flutter/quran_widget_flutter.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({
    Key? key,
    required this.onTap,
    required this.onLongTap,
  }) : super(key: key);

  final Function(String data) onTap;
  final Function(String data) onLongTap;

  final offset1 = const Offset(50, 400);
  final offset2 = const Offset(200, 400);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is PagesFetchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuranInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PagesFetchedState) {
          return _viewData(state.pages);
        } else {
          return _errorView((state as PagesFetchErrorState).error);
        }
      },
    );
  }

  viewData(cubit, state) {
    List<page.Page>? pages = cubit.pages;
    print('pages  QuranPage ' + pages.toString());

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: PageView.builder(
        itemCount: pages!.length,
        itemBuilder: (context, indexPage) => Stack(
          children: [
            if ((state is PagesFetchedState))
              const Text(
                'PagesFetchedState',
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: Q.qaloon),
                textAlign: TextAlign.center,
              ),
            if ((state is PagesFetchLoadingState))
              const Text(
                'PagesFetchLoadingState',
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: Q.qaloon),
                textAlign: TextAlign.center,
              ),
            if ((state is PagesFetchErrorState))
              const Text(
                'PagesFetchErrorState',
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: Q.qaloon),
                textAlign: TextAlign.center,
              ),
            (state is PagesFetchLoadingState && pages[indexPage].verses != null)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: pages[indexPage].verses!.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: () {},
                      onTap: () {},
                      child: Text(
                        pages[indexPage].verses![index].uthmanicText.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: Q.qaloon),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
            // Image.asset('assets/img/quranImg.jpg'),
          ],
        ),
      ),
    );
  }

  Center _errorView(String error) {
    return const Center(
      child: Text(
        'PagesFetchErrorState',
        style:
            TextStyle(color: Colors.black, fontSize: 25, fontFamily: Q.qaloon),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _viewData(List<page.Page> pages) {
    if (pages.isNotEmpty) {
      List<page.Page> pagesf = <page.Page>[];
      for (var element in pages) {
        if (element.verses != null && element.verses!.isNotEmpty) {
          pagesf.add(element);
        }
      }

      if (pagesf.isNotEmpty) {
        pages = pagesf;
      } else {
        return const Text('Empty data');
      }
    } else {
      return const Text('Empty data');
    }

    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, indexPage) => Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: pages[indexPage].verses!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onLongPress: () {
                    onLongTap(pages[indexPage]
                        .verses![index]
                        .uthmanicText
                        .toString());
                  },
                  onTap: () {
                    onLongTap(pages[indexPage]
                        .verses![index]
                        .uthmanicText
                        .toString());
                  },
                  child: Text(
                    pages[indexPage].verses![index].uthmanicText.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: Q.hafs15),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              // Image.asset('assets/img/quranImg.jpg'),
            ],
          ),
        ));
  }
}
