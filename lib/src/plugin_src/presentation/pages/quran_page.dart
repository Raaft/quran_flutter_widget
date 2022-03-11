import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_widget_flutter/helper/q.dart';
import 'package:quran_widget_flutter/model/page.dart' as page;
import 'package:quran_widget_flutter/quran_widget_flutter.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({
    Key? key,
    required this.onTap,
    required this.onLongTap,
    required this.cubit,
  }) : super(key: key);

  final Function(String data) onTap;
  final Function(String data) onLongTap;

  final QuranCubit cubit;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final offset1 = const Offset(50, 400);

  final offset2 = const Offset(200, 400);
  List<int> selectedIndex = [];
  bool isSelectedVeirse = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        print('State Is ' + state.toString());
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
          itemBuilder: (context, indexPage) => Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: pages[indexPage].verses!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onLongPress: () {
                    setState(() {
                      if (selectedIndex.contains(index)) {
                        selectedIndex.remove(index);
                      } else {
                        selectedIndex.add(index);
                      }
                      selectedIndex.sort();
                      if (selectedIndex.isNotEmpty) {
                        isSelectedVeirse = true;
                      } else {
                        isSelectedVeirse = false;
                      }
                      print('List of versis before $selectedIndex');

                      /* for(int num in selectedIndex){
                        if(selectedIndex.contains(index+1) == false && selectedIndex.last != index){
                          selectedIndex.add(index+1);
                        }
                        return null; // No missing value
                      }
                      selectedIndex.sort();

                      print('List of versis before $selectedIndex');*/
                    });
                    widget.onLongTap(pages[indexPage]
                        .verses![index]
                        .uthmanicText
                        .toString());
                  },
                  onTap: () {
                    if(isSelectedVeirse){

                      setState(() {
                        if (selectedIndex.contains(index)) {
                          selectedIndex.remove(index);
                        } else {
                          selectedIndex.add(index);
                        }
                        selectedIndex.sort();
                        if (selectedIndex.isNotEmpty) {
                          isSelectedVeirse = true;
                        } else {
                          isSelectedVeirse = false;
                        }
                        print('List of versis before $selectedIndex');

                        /* for(int num in selectedIndex){
                        if(selectedIndex.contains(index+1) == false && selectedIndex.last != index){
                          selectedIndex.add(index+1);
                        }
                        return null; // No missing value
                      }
                      selectedIndex.sort();

                      print('List of versis before $selectedIndex');*/
                      });
                    }
                    widget.onTap(pages[indexPage]
                        .verses![index]
                        .uthmanicText
                        .toString());
                  },
                  child: Text(
                    pages[indexPage].verses![index].uthmanicText.toString(),
                    style: TextStyle(
                        backgroundColor: (selectedIndex.contains(index))
                            ? Colors.yellow.withOpacity(.2)
                            : Colors.white.withOpacity(0),
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
