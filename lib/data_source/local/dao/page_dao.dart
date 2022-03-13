import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/page.dart';

@dao
abstract class PageDao {
  @Query('SELECT * FROM Page')
  Future<List<Page>> findAllPages();

  @Query('SELECT * FROM Page WHERE id = :id')
  Stream<Page?> findPageById(int id);

  ///* you can filter pages by >book, >narration, >part, subpart or >chapter (by id)

  @Query(
      'SELECT * FROM Page WHERE narration = :narrationId or chapters= :chapterid or book =:bookId or part =:partId or sub_part =:subPartId')
  Future<Page?> findPageFilters(
    int narrationId,
    int chapterid,
    int bookId,
    int partId,
    int subPartId,
  );

  @Query(
      'SELECT  DISTINCT(Page.id), Page.* FROM Page,ChaptersPage WHERE narration = :narrationId and ChaptersPage.chapterId = :chapterid and book = :bookId and ChaptersPage.pageId = Page.id ORDER by Page.page_number')
  Future<List<Page>?> findChapterPage(
    int narrationId,
    int chapterid,
    int bookId,
  );

  @insert
  Future<void> insertPage(Page page);

  @update
  Future<void> updatePage(Page page);

  @delete
  Future<void> deletePage(Page page);
}
