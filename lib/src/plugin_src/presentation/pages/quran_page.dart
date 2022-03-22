import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_widget_flutter/helper/q.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;
import 'package:quran_widget_flutter/model/verse.dart';
import 'package:quran_widget_flutter/quran_widget_flutter.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({
    Key? key,
    required this.onTap,
    required this.onLongTap,
    required this.cubit,
    required this.getPage,
  }) : super(key: key);

  final Function(String data, bool isSelextedVerse,
      Map<int, List<int>>? selectedIndex, List<Verse>? selectedVerses) onTap;
  final Function(
      String data,
      bool isSelextedVerse,
      Map<int, List<int>>? selectedIndex,
      List<Verse>? selectedVerses) onLongTap;
  final Function(page.Page data) getPage;

  final QuranCubit cubit;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final offset1 = const Offset(50, 400);

  final offset2 = const Offset(200, 400);
  // Map<int, List<int>> selectedIndex = {};
  bool isSelectedVeirse = false;

  int firstIndex = 0;
  int lastIndex = 0;
  int firstIndexPage = 0;

  int lastIndexPage = 0;

  bool isFist = true;

  void onTap(index, indexPage, pages) {
    if (widget.cubit.selectedIndex.containsKey(indexPage) &&
        widget.cubit.selectedIndex[indexPage]!.contains(index)) {
      widget.cubit.selectedIndex.clear();
      widget.cubit.selectedVerses.clear();
      isSelectedVeirse = false;
      firstIndex = 0;
      lastIndex = 0;
      firstIndexPage = 0;
      lastIndexPage = 0;
    } else {
      if (!isSelectedVeirse) {
        firstIndex = index;
        firstIndexPage = indexPage;
        lastIndexPage = indexPage;
        widget.cubit.selectedIndex.addAll({
          indexPage: [index]
        });

        widget.cubit.selectedVerses.add(pages[indexPage].verses![index]);
        isSelectedVeirse = true;
      }
      if (isSelectedVeirse) {
        widget.cubit.selectedVerses.clear();
        if (firstIndexPage >= lastIndexPage) {
          if (index < firstIndex) {
            lastIndex = firstIndex;
            firstIndex = index;
            lastIndexPage = firstIndexPage;
            firstIndexPage = indexPage;
          } else {
            lastIndex = index;
            lastIndexPage = indexPage;
          }
        }
      }

      print('List of versis before ${widget.cubit.selectedIndex}');

      // selectedIndex.clear();
      // widget.cubit.selectedVerses.clear();
      for (int i = firstIndexPage; i <= lastIndexPage; i++) {
        widget.cubit.selectedIndex[i] = [];
        if (i == lastIndexPage) {
          for (int idx = (i == firstIndexPage ? firstIndex : 0);
              idx <= lastIndex;
              idx++) {
            widget.cubit.selectedIndex[i]!.add(idx);
            widget.cubit.selectedVerses.add(pages[indexPage].verses![idx]);
          }
        } else {
          for (int idx = (i == firstIndexPage ? firstIndex : 0);
              idx <= pages[i].verses!.length - 1;
              idx++) {
            widget.cubit.selectedIndex[i]!.add(idx);
            widget.cubit.selectedVerses.add(pages[indexPage].verses![idx]);
          }
        }
      }
    }

    print('List of versis before ${widget.cubit.selectedIndex}');
    print('List of selected versis ${widget.cubit.selectedVerses}');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        print('State Is ' + state.toString());

        if (state is PagesFetchedState && isFist) {
          widget.getPage(state.pages[0]);
          isFist = false;
        }

        return Stack(
          children: [
            if (state is PagesFetchLoadingState)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is QuranInitial)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state is PagesFetchedState) _viewData(state.pages),
            if (state is PagesFetchErrorState) _errorView(state.error),
          ],
        );
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
        onPageChanged: (inedx) {},
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
                          fontFamily: 'Hafs17',
                        ),
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
    return Center(
      child: Text(
        'PagesFetchErrorState $error',
        style: const TextStyle(
            color: Colors.black, fontSize: 25, fontFamily: Q.qaloon),
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
          onPageChanged: (index) {
            widget.getPage(pages[index]);
          },
          itemBuilder: (context, indexPage) => Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: pages[indexPage].verses!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onLongPress: () {
                    setState(() {
                      if (!isSelectedVeirse) {
                        firstIndex = index;
                        firstIndexPage = indexPage;
                        widget.cubit.selectedIndex.addAll({
                          indexPage: [index]
                        });
                        isSelectedVeirse = true;
                      }

                      if (isSelectedVeirse) {
                        if (firstIndexPage == lastIndexPage) {
                          if (index < firstIndex) {
                            lastIndex = firstIndex;
                            firstIndex = index;
                            lastIndexPage = firstIndexPage;
                            firstIndexPage = indexPage;
                          } else {
                            lastIndex = index;
                            lastIndexPage = indexPage;
                          }
                        }
                      }

                      print(
                          'List of versis before $widget.cubit.selectedIndex');
                      print(
                          'List of versis before ${widget.cubit.selectedVerses}');

                      // selectedIndex.clear();
                      for (int i = firstIndexPage; i <= lastIndexPage; i++) {
                        widget.cubit.selectedIndex[i] = [];
                        if (i == lastIndexPage) {
                          for (int idx = (i == firstIndexPage ? firstIndex : 0);
                              idx <= lastIndex;
                              idx++) {
                            widget.cubit.selectedIndex[i]!.add(idx);
                            widget.cubit.selectedVerses
                                .add(pages[indexPage].verses![idx]);
                          }
                        } else {
                          for (int idx = (i == firstIndexPage ? firstIndex : 0);
                              idx <= pages[i].verses!.length - 1;
                              idx++) {
                            widget.cubit.selectedIndex[i]!.add(idx);
                            widget.cubit.selectedVerses
                                .add(pages[indexPage].verses![idx]);
                          }
                        }
                      }

                      print(
                          'List of versis before $widget.cubit.selectedIndex');
                      print(
                          'List of versis before ${widget.cubit.selectedVerses}');
                    });
                    widget.onLongTap(
                      pages[indexPage].verses![index].uthmanicText.toString(),
                      widget.cubit.selectedIndex.isNotEmpty,
                      widget.cubit.selectedIndex,
                      widget.cubit.selectedVerses,
                    );
                  },
                  onTap: () {
                    if (isSelectedVeirse) {
                      setState(() => onTap(index, indexPage, pages));
                    }
                    widget.onTap(
                      pages[indexPage].verses![index].uthmanicText.toString(),
                      widget.cubit.selectedIndex.isNotEmpty,
                      widget.cubit.selectedIndex,
                      widget.cubit.selectedVerses,
                    );
                  },
                  child: Container(
                    color: widget.cubit.selectedIndex.containsKey(indexPage)
                        ? (widget.cubit.selectedIndex[indexPage]!
                                .contains(index))
                            ? Colors.yellow.withOpacity(.2)
                            : Colors.white.withOpacity(0)
                        : Colors.white.withOpacity(0),
                    child: Text(
                      pages[indexPage].verses![index].uthmanicText.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: Q.hafs17,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              // Image.asset('assets/img/quranImg.jpg'),
            ],
          ),
        ));
  }
}
