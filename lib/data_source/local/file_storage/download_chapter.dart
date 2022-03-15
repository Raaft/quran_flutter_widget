import 'package:quran_widget_flutter/data_source/data_source.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';

class DownloadChapter {
  static startDownload({
    required int chapterId,
    required int recitationId,
    Function(double)? retunProgress,
  }) async {
    List<RecitationVerses>? verses = await DataSource.instance
        .fetchRecitationsVersesChapterList(
            recitationId: recitationId, chapterId: chapterId);

    print(verses);
    // List<Page>? pages = await DataSource.instance
    //     .fetchPagesList(bookId: bookId, narrationId: narrationId);

    // if (pages != null && pages.isNotEmpty) {
    //   var sizePage = pages.length;

    //   print(pages.toString());

    //   for (var page in pages) {
    //     var index = pages.indexOf(page);
    //     if (page.image != null && page.image!.isNotEmpty) {
    //       print(page.image);
    //       await FileStorage()
    //           .download2(
    //         url: Apis.baseUrl + page.image.toString(),
    //         savePath:
    //             '/pages_images/narraton_${page.narrationId}/book_${page.bookId}/chapter_${page.chapters![0].chapterId}/page_${page.pageNumber}',
    //         showDownloadProgress: (p0, p1) {
    //           double progress = index / sizePage;
    //           if ((p0 / p1) <= .5) {
    //             progress = (index - 1) / sizePage;
    //           } else {
    //             progress = index / sizePage;
    //           }

    //           if (retunProgress != null) {
    //             retunProgress(progress);
    //           }

    //           if (index == sizePage && (p1 / p0 * 100) == 100) {
    //             retunProgress!(1);
    //           }
    //         },
    //       )
    //           .then((value) {
    //         page.localImage = value!.path;
    //         _pageLocalDataSource.updateVerse(page);
    //       });
    //     }
    //   }
    // }
    // retunProgress!(1.0);
  }
}
