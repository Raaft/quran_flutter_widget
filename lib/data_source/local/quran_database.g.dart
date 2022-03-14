// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorQuranDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuranDatabaseBuilder databaseBuilder(String name) =>
      _$QuranDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuranDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$QuranDatabaseBuilder(null);
}

class _$QuranDatabaseBuilder {
  _$QuranDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$QuranDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$QuranDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<QuranDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$QuranDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$QuranDatabase extends QuranDatabase {
  _$QuranDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NarrationDao? _narrationDaoInstance;

  BookDao? _bookDaoInstance;

  ChapterDao? _chapterDaoInstance;

  PartDao? _partDaoInstance;

  PageDao? _pageDaoInstance;

  RecitationDao? _recitationDaoInstance;

  ReciterDao? _reciterDaoInstance;

  RecitationVersesDao? _recitationVersesDaoInstance;

  VerseDao? _verseDaoInstance;

  GlyphDao? _glyphDaoInstance;

  ChaptersPageDao? _chaptersPageDaoInstance;

  ChapterDownloadDao? _chapterDownloadDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Narration` (`id` INTEGER, `name` TEXT, `description` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Book` (`id` INTEGER, `name` TEXT, `narration` INTEGER, `downloaded` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Chapter` (`id` INTEGER, `name` TEXT, `chapter_number` INTEGER, `origin` TEXT, `pageFrom` INTEGER, `pageTo` INTEGER, `versesSize` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Part` (`id` INTEGER, `name` TEXT, `alias` TEXT, `part_number` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Page` (`id` INTEGER, `page_number` INTEGER, `narration` INTEGER, `book` INTEGER, `part` INTEGER, `sub_part` INTEGER, `image` TEXT, `localImage` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Recitation` (`id` INTEGER, `narration` INTEGER, `reciter` INTEGER, `name` TEXT,  PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Reciter` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RecitationVerses` (`id` INTEGER, `verse` INTEGER, `verse_number` INTEGER, `recitation` INTEGER, `record` TEXT, `recordLocal` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Verse` (`id` INTEGER, `text` TEXT, `uthmanic_text` TEXT, `line_start` INTEGER, `line_end` INTEGER, `image` TEXT, `narration` INTEGER, `chapter` INTEGER, `book` INTEGER, `part` INTEGER, `page` INTEGER, `verse_number` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Glyph` (`id` INTEGER, `verse` INTEGER, `page` INTEGER, `chapter` INTEGER, `line_number` INTEGER, `position` INTEGER, `minX` INTEGER, `maxX` INTEGER, `minY` INTEGER, `maxY` INTEGER,  PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ChaptersPage` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `pageId` INTEGER, `chapterId` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ChapterDownload` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `narrationId` INTEGER, `reciterId` INTEGER, `recitationId` INTEGER, `chapterId` INTEGER, `downloaded` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NarrationDao get narrationDao {
    return _narrationDaoInstance ??= _$NarrationDao(database, changeListener);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }

  @override
  ChapterDao get chapterDao {
    return _chapterDaoInstance ??= _$ChapterDao(database, changeListener);
  }

  @override
  PartDao get partDao {
    return _partDaoInstance ??= _$PartDao(database, changeListener);
  }

  @override
  PageDao get pageDao {
    return _pageDaoInstance ??= _$PageDao(database, changeListener);
  }

  @override
  RecitationDao get recitationDao {
    return _recitationDaoInstance ??= _$RecitationDao(database, changeListener);
  }

  @override
  ReciterDao get reciterDao {
    return _reciterDaoInstance ??= _$ReciterDao(database, changeListener);
  }

  @override
  RecitationVersesDao get recitationVersesDao {
    return _recitationVersesDaoInstance ??=
        _$RecitationVersesDao(database, changeListener);
  }

  @override
  VerseDao get verseDao {
    return _verseDaoInstance ??= _$VerseDao(database, changeListener);
  }

  @override
  GlyphDao get glyphDao {
    return _glyphDaoInstance ??= _$GlyphDao(database, changeListener);
  }

  @override
  ChaptersPageDao get chaptersPageDao {
    return _chaptersPageDaoInstance ??=
        _$ChaptersPageDao(database, changeListener);
  }

  @override
  ChapterDownloadDao get chapterDownloadDao {
    return _chapterDownloadDaoInstance ??=
        _$ChapterDownloadDao(database, changeListener);
  }
}

class _$NarrationDao extends NarrationDao {
  _$NarrationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _narrationInsertionAdapter = InsertionAdapter(
            database,
            'Narration',
            (Narration item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                },
            changeListener),
        _narrationUpdateAdapter = UpdateAdapter(
            database,
            'Narration',
            ['id'],
            (Narration item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                },
            changeListener),
        _narrationDeletionAdapter = DeletionAdapter(
            database,
            'Narration',
            ['id'],
            (Narration item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Narration> _narrationInsertionAdapter;

  final UpdateAdapter<Narration> _narrationUpdateAdapter;

  final DeletionAdapter<Narration> _narrationDeletionAdapter;

  @override
  Future<List<Narration>> findAllNarrations() async {
    return _queryAdapter.queryList('SELECT * FROM Narration',
        mapper: (Map<String, Object?> row) => Narration.fromJson(row));
  }

  @override
  Stream<Narration?> findNarrationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Narration WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Narration.fromJson(row),
        arguments: [id],
        queryableName: 'Narration',
        isView: false);
  }

  @override
  Future<List<Narration>> searchInNarration(String qurey) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Narration WHERE name like ?1 or description like ?1',
        mapper: (Map<String, Object?> row) => Narration.fromJson(row),
        arguments: [qurey]);
  }

  @override
  Future<void> insertNarration(Narration narration) async {
    await _narrationInsertionAdapter.insert(
        narration, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateNarration(Narration narration) async {
    await _narrationUpdateAdapter.update(narration, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteNarration(Narration narration) async {
    await _narrationDeletionAdapter.delete(narration);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _bookInsertionAdapter = InsertionAdapter(
            database,
            'Book',
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'narration': item.narrationId,
                  'downloaded': item.downloaded == null
                      ? null
                      : (item.downloaded! ? 1 : 0)
                },
            changeListener),
        _bookUpdateAdapter = UpdateAdapter(
            database,
            'Book',
            ['id'],
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'narration': item.narrationId,
                  'downloaded': item.downloaded == null
                      ? null
                      : (item.downloaded! ? 1 : 0)
                },
            changeListener),
        _bookDeletionAdapter = DeletionAdapter(
            database,
            'Book',
            ['id'],
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'narration': item.narrationId,
                  'downloaded': item.downloaded == null
                      ? null
                      : (item.downloaded! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Book> _bookInsertionAdapter;

  final UpdateAdapter<Book> _bookUpdateAdapter;

  final DeletionAdapter<Book> _bookDeletionAdapter;

  @override
  Future<List<Book>> findAllBooks() async {
    return _queryAdapter.queryList('SELECT * FROM Book',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            name: row['name'] as String?,
            narrationId: row['narration'] as int?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0));
  }

  @override
  Future<List<Book>> searchInBooks(String qurey) async {
    return _queryAdapter.queryList('SELECT * FROM Book WHERE name like ?1',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            name: row['name'] as String?,
            narrationId: row['narration'] as int?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0),
        arguments: [qurey]);
  }

  @override
  Future<List<Book>> findBooksInNarrationId(int narrationId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Book WHERE narration = ?1 or downloaded > 0',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            name: row['name'] as String?,
            narrationId: row['narration'] as int?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0),
        arguments: [narrationId]);
  }

  @override
  Stream<Book?> findBookById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Book WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Book(
            id: row['id'] as int?,
            name: row['name'] as String?,
            narrationId: row['narration'] as int?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0),
        arguments: [id],
        queryableName: 'Book',
        isView: false);
  }

  @override
  Future<void> insertBook(Book book) async {
    await _bookInsertionAdapter.insert(book, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateBook(Book book) async {
    await _bookUpdateAdapter.update(book, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteBook(Book book) async {
    await _bookDeletionAdapter.delete(book);
  }
}

class _$ChapterDao extends ChapterDao {
  _$ChapterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _chapterInsertionAdapter = InsertionAdapter(
            database,
            'Chapter',
            (Chapter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'chapter_number': item.chapterNumber,
                  'origin': item.origin,
                  'pageFrom': item.pageFrom,
                  'pageTo': item.pageTo,
                  'versesSize': item.versesSize
                },
            changeListener),
        _chapterUpdateAdapter = UpdateAdapter(
            database,
            'Chapter',
            ['id'],
            (Chapter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'chapter_number': item.chapterNumber,
                  'origin': item.origin,
                  'pageFrom': item.pageFrom,
                  'pageTo': item.pageTo,
                  'versesSize': item.versesSize
                },
            changeListener),
        _chapterDeletionAdapter = DeletionAdapter(
            database,
            'Chapter',
            ['id'],
            (Chapter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'chapter_number': item.chapterNumber,
                  'origin': item.origin,
                  'pageFrom': item.pageFrom,
                  'pageTo': item.pageTo,
                  'versesSize': item.versesSize
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Chapter> _chapterInsertionAdapter;

  final UpdateAdapter<Chapter> _chapterUpdateAdapter;

  final DeletionAdapter<Chapter> _chapterDeletionAdapter;

  @override
  Future<List<Chapter>> findAllChapters() async {
    return _queryAdapter.queryList('SELECT * FROM Chapter',
        mapper: (Map<String, Object?> row) => Chapter(
            id: row['id'] as int?,
            name: row['name'] as String?,
            chapterNumber: row['chapter_number'] as int?,
            origin: row['origin'] as String?,
            pageFrom: row['pageFrom'] as int?,
            pageTo: row['pageTo'] as int?,
            versesSize: row['versesSize'] as int?));
  }

  @override
  Stream<Chapter?> findChapterById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Chapter WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Chapter(
            id: row['id'] as int?,
            name: row['name'] as String?,
            chapterNumber: row['chapter_number'] as int?,
            origin: row['origin'] as String?,
            pageFrom: row['pageFrom'] as int?,
            pageTo: row['pageTo'] as int?,
            versesSize: row['versesSize'] as int?),
        arguments: [id],
        queryableName: 'Chapter',
        isView: false);
  }

  @override
  Future<List<Chapter>> searchInChapter(String qurey) async {
    return _queryAdapter.queryList('SELECT * FROM Chapter WHERE name like ?1',
        mapper: (Map<String, Object?> row) => Chapter(
            id: row['id'] as int?,
            name: row['name'] as String?,
            chapterNumber: row['chapter_number'] as int?,
            origin: row['origin'] as String?,
            pageFrom: row['pageFrom'] as int?,
            pageTo: row['pageTo'] as int?,
            versesSize: row['versesSize'] as int?),
        arguments: [qurey]);
  }

  @override
  Future<void> insertChapter(Chapter chapter) async {
    await _chapterInsertionAdapter.insert(chapter, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateChapter(Chapter chapter) async {
    await _chapterUpdateAdapter.update(chapter, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteChapter(Chapter chapter) async {
    await _chapterDeletionAdapter.delete(chapter);
  }
}

class _$PartDao extends PartDao {
  _$PartDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _partInsertionAdapter = InsertionAdapter(
            database,
            'Part',
            (Part item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'alias': item.alias,
                  'part_number': item.partNumber
                },
            changeListener),
        _partUpdateAdapter = UpdateAdapter(
            database,
            'Part',
            ['id'],
            (Part item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'alias': item.alias,
                  'part_number': item.partNumber
                },
            changeListener),
        _partDeletionAdapter = DeletionAdapter(
            database,
            'Part',
            ['id'],
            (Part item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'alias': item.alias,
                  'part_number': item.partNumber
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Part> _partInsertionAdapter;

  final UpdateAdapter<Part> _partUpdateAdapter;

  final DeletionAdapter<Part> _partDeletionAdapter;

  @override
  Future<List<Part>> findAllParts() async {
    return _queryAdapter.queryList('SELECT * FROM Part',
        mapper: (Map<String, Object?> row) => Part(
            row['id'] as int?,
            row['name'] as String?,
            row['alias'] as String?,
            row['part_number'] as int?));
  }

  @override
  Future<List<Part>> searchInPart(String qurey) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Part WHERE name like ?1 or alias like ?1',
        mapper: (Map<String, Object?> row) => Part(
            row['id'] as int?,
            row['name'] as String?,
            row['alias'] as String?,
            row['part_number'] as int?),
        arguments: [qurey]);
  }

  @override
  Stream<Part?> findPartById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Part WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Part(
            row['id'] as int?,
            row['name'] as String?,
            row['alias'] as String?,
            row['part_number'] as int?),
        arguments: [id],
        queryableName: 'Part',
        isView: false);
  }

  @override
  Future<void> insertPart(Part part) async {
    await _partInsertionAdapter.insert(part, OnConflictStrategy.replace);
  }

  @override
  Future<void> updatePart(Part part) async {
    await _partUpdateAdapter.update(part, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePart(Part part) async {
    await _partDeletionAdapter.delete(part);
  }
}

class _$PageDao extends PageDao {
  _$PageDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _pageInsertionAdapter = InsertionAdapter(
            database,
            'Page',
            (Page item) => <String, Object?>{
                  'id': item.id,
                  'page_number': item.pageNumber,
                  'narration': item.narrationId,
                  'book': item.bookId,
                  'part': item.partId,
                  'sub_part': item.subPartId,
                  'image': item.image,
                  'localImage': item.localImage
                },
            changeListener),
        _pageUpdateAdapter = UpdateAdapter(
            database,
            'Page',
            ['id'],
            (Page item) => <String, Object?>{
                  'id': item.id,
                  'page_number': item.pageNumber,
                  'narration': item.narrationId,
                  'book': item.bookId,
                  'part': item.partId,
                  'sub_part': item.subPartId,
                  'image': item.image,
                  'localImage': item.localImage
                },
            changeListener),
        _pageDeletionAdapter = DeletionAdapter(
            database,
            'Page',
            ['id'],
            (Page item) => <String, Object?>{
                  'id': item.id,
                  'page_number': item.pageNumber,
                  'narration': item.narrationId,
                  'book': item.bookId,
                  'part': item.partId,
                  'sub_part': item.subPartId,
                  'image': item.image,
                  'localImage': item.localImage
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Page> _pageInsertionAdapter;

  final UpdateAdapter<Page> _pageUpdateAdapter;

  final DeletionAdapter<Page> _pageDeletionAdapter;

  @override
  Future<List<Page>> findAllPages() async {
    return _queryAdapter.queryList('SELECT * FROM Page',
        mapper: (Map<String, Object?> row) => Page(
            id: row['id'] as int?,
            pageNumber: row['page_number'] as int?,
            narrationId: row['narration'] as int?,
            bookId: row['book'] as int?,
            partId: row['part'] as int?,
            subPartId: row['sub_part'] as int?,
            image: row['image'] as String?,
            localImage: row['localImage'] as String?));
  }

  @override
  Stream<Page?> findPageById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Page WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Page(
            id: row['id'] as int?,
            pageNumber: row['page_number'] as int?,
            narrationId: row['narration'] as int?,
            bookId: row['book'] as int?,
            partId: row['part'] as int?,
            subPartId: row['sub_part'] as int?,
            image: row['image'] as String?,
            localImage: row['localImage'] as String?),
        arguments: [id],
        queryableName: 'Page',
        isView: false);
  }

  @override
  Future<Page?> findPageFilters(int narrationId, int chapterid, int bookId,
      int partId, int subPartId) async {
    return _queryAdapter.query(
        'SELECT * FROM Page WHERE narration = ?1 or chapters= ?2 or book =?3 or part =?4 or sub_part =?5',
        mapper: (Map<String, Object?> row) => Page(id: row['id'] as int?, pageNumber: row['page_number'] as int?, narrationId: row['narration'] as int?, bookId: row['book'] as int?, partId: row['part'] as int?, subPartId: row['sub_part'] as int?, image: row['image'] as String?, localImage: row['localImage'] as String?),
        arguments: [narrationId, chapterid, bookId, partId, subPartId]);
  }

  @override
  Future<List<Page>?> findChapterPage(
      int narrationId, int chapterid, int bookId) async {
    return _queryAdapter.queryList(
        'SELECT  DISTINCT(Page.page_number), Page.* FROM Page,ChaptersPage WHERE narration = ?1 and ChaptersPage.chapterId = ?2 and book = ?3 and ChaptersPage.pageId = Page.id ORDER by Page.page_number',
        mapper: (Map<String, Object?> row) => Page(id: row['id'] as int?, pageNumber: row['page_number'] as int?, narrationId: row['narration'] as int?, bookId: row['book'] as int?, partId: row['part'] as int?, subPartId: row['sub_part'] as int?, image: row['image'] as String?, localImage: row['localImage'] as String?),
        arguments: [narrationId, chapterid, bookId]);
  }

  @override
  Future<void> insertPage(Page page) async {
    await _pageInsertionAdapter.insert(page, OnConflictStrategy.replace);
  }

  @override
  Future<void> updatePage(Page page) async {
    await _pageUpdateAdapter.update(page, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePage(Page page) async {
    await _pageDeletionAdapter.delete(page);
  }
}

class _$RecitationDao extends RecitationDao {
  _$RecitationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _recitationInsertionAdapter = InsertionAdapter(
            database,
            'Recitation',
            (Recitation item) => <String, Object?>{
                  'id': item.id,
                  'narration': item.narrationId,
                  'reciter': item.reciterId,
                  'name': item.name
                },
            changeListener),
        _recitationUpdateAdapter = UpdateAdapter(
            database,
            'Recitation',
            ['id'],
            (Recitation item) => <String, Object?>{
                  'id': item.id,
                  'narration': item.narrationId,
                  'reciter': item.reciterId,
                  'name': item.name
                },
            changeListener),
        _recitationDeletionAdapter = DeletionAdapter(
            database,
            'Recitation',
            ['id'],
            (Recitation item) => <String, Object?>{
                  'id': item.id,
                  'narration': item.narrationId,
                  'reciter': item.reciterId,
                  'name': item.name
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Recitation> _recitationInsertionAdapter;

  final UpdateAdapter<Recitation> _recitationUpdateAdapter;

  final DeletionAdapter<Recitation> _recitationDeletionAdapter;

  @override
  Future<List<Recitation>> findAllRecitations() async {
    return _queryAdapter.queryList('SELECT * FROM Recitation',
        mapper: (Map<String, Object?> row) => Recitation(
            row['id'] as int?,
            row['narration'] as int?,
            row['reciter'] as int?,
            row['name'] as String?));
  }

  @override
  Future<List<Recitation>> findRecitationInNarrationId(int narrationId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Recitation WHERE narration = ?1',
        mapper: (Map<String, Object?> row) => Recitation(
            row['id'] as int?,
            row['narration'] as int?,
            row['reciter'] as int?,
            row['name'] as String?),
        arguments: [narrationId]);
  }

  @override
  Stream<Recitation?> findRecitationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Recitation WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Recitation(
            row['id'] as int?,
            row['narration'] as int?,
            row['reciter'] as int?,
            row['name'] as String?),
        arguments: [id],
        queryableName: 'Recitation',
        isView: false);
  }

  @override
  Future<void> insertRecitation(Recitation recitation) async {
    await _recitationInsertionAdapter.insert(
        recitation, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateRecitation(Recitation recitation) async {
    await _recitationUpdateAdapter.update(
        recitation, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteRecitation(Recitation recitation) async {
    await _recitationDeletionAdapter.delete(recitation);
  }
}

class _$ReciterDao extends ReciterDao {
  _$ReciterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _reciterInsertionAdapter = InsertionAdapter(
            database,
            'Reciter',
            (Reciter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _reciterUpdateAdapter = UpdateAdapter(
            database,
            'Reciter',
            ['id'],
            (Reciter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _reciterDeletionAdapter = DeletionAdapter(
            database,
            'Reciter',
            ['id'],
            (Reciter item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Reciter> _reciterInsertionAdapter;

  final UpdateAdapter<Reciter> _reciterUpdateAdapter;

  final DeletionAdapter<Reciter> _reciterDeletionAdapter;

  @override
  Future<List<Reciter>> findAllReciters() async {
    return _queryAdapter.queryList('SELECT * FROM Reciter',
        mapper: (Map<String, Object?> row) =>
            Reciter(row['id'] as int?, row['name'] as String?));
  }

  @override
  Future<List<Reciter>> searchInReciter(String qurey) async {
    return _queryAdapter.queryList('SELECT * FROM Reciter WHERE name like ?1',
        mapper: (Map<String, Object?> row) =>
            Reciter(row['id'] as int?, row['name'] as String?),
        arguments: [qurey]);
  }

  @override
  Stream<Reciter?> findReciterById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Reciter WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Reciter(row['id'] as int?, row['name'] as String?),
        arguments: [id],
        queryableName: 'Reciter',
        isView: false);
  }

  @override
  Future<void> insertReciter(Reciter reciter) async {
    await _reciterInsertionAdapter.insert(reciter, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateReciter(Reciter reciter) async {
    await _reciterUpdateAdapter.update(reciter, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteReciter(Reciter reciter) async {
    await _reciterDeletionAdapter.delete(reciter);
  }
}

class _$RecitationVersesDao extends RecitationVersesDao {
  _$RecitationVersesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _recitationVersesInsertionAdapter = InsertionAdapter(
            database,
            'RecitationVerses',
            (RecitationVerses item) => <String, Object?>{
                  'id': item.id,
                  'chapter': item.chapterId,
                  'verse_number': item.verseNumber,
                  'recitation': item.recitationId,
                  'record': item.record,
                  'recordLocal': item.recordLocal
                },
            changeListener),
        _recitationVersesUpdateAdapter = UpdateAdapter(
            database,
            'RecitationVerses',
            ['id'],
            (RecitationVerses item) => <String, Object?>{
                  'id': item.id,
                  'chapter': item.chapterId,
                  'verse_number': item.verseNumber,
                  'recitation': item.recitationId,
                  'record': item.record,
                  'recordLocal': item.recordLocal
                },
            changeListener),
        _recitationVersesDeletionAdapter = DeletionAdapter(
            database,
            'RecitationVerses',
            ['id'],
            (RecitationVerses item) => <String, Object?>{
                  'id': item.id,
                  'chapter': item.chapterId,
                  'verse_number': item.verseNumber,
                  'recitation': item.recitationId,
                  'record': item.record,
                  'recordLocal': item.recordLocal
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecitationVerses> _recitationVersesInsertionAdapter;

  final UpdateAdapter<RecitationVerses> _recitationVersesUpdateAdapter;

  final DeletionAdapter<RecitationVerses> _recitationVersesDeletionAdapter;

  @override
  Future<List<RecitationVerses>> findAllRecitationsVerses() async {
    return _queryAdapter.queryList('SELECT * FROM RecitationVerses',
        mapper: (Map<String, Object?> row) => RecitationVerses(
            row['id'] as int?,
            row['verse'] as int?,
            row['verse_number'] as int?,
            row['recitation'] as int?,
            row['record'] as String?,
            row['recordLocal'] as String?));
  }

  @override
  Stream<RecitationVerses?> findRecitationVersesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RecitationVerses WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RecitationVerses(
            row['id'] as int?,
            row['verse'] as int?,
            row['verse_number'] as int?,
            row['recitation'] as int?,
            row['record'] as String?,
            row['recordLocal'] as String?),
        arguments: [id],
        queryableName: 'RecitationVerses',
        isView: false);
  }

  @override
  Future<void> insertRecitationVerses(RecitationVerses recitationVerses) async {
    await _recitationVersesInsertionAdapter.insert(
        recitationVerses, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateRecitationVerses(RecitationVerses recitationVerses) async {
    await _recitationVersesUpdateAdapter.update(
        recitationVerses, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteRecitationVerses(RecitationVerses recitationVerses) async {
    await _recitationVersesDeletionAdapter.delete(recitationVerses);
  }
}

class _$VerseDao extends VerseDao {
  _$VerseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _verseInsertionAdapter = InsertionAdapter(
            database,
            'Verse',
            (Verse item) => <String, Object?>{
                  'id': item.id,
                  'text': item.text,
                  'uthmanic_text': item.uthmanicText,
                  'line_start': item.lineStart,
                  'line_end': item.lineEnd,
                  'image': item.image,
                  'narration': item.narrationId,
                  'chapter': item.chapterId,
                  'book': item.bookId,
                  'part': item.partId,
                  'page': item.pageId,
                  'verse_number': item.verseNumber
                },
            changeListener),
        _verseUpdateAdapter = UpdateAdapter(
            database,
            'Verse',
            ['id'],
            (Verse item) => <String, Object?>{
                  'id': item.id,
                  'text': item.text,
                  'uthmanic_text': item.uthmanicText,
                  'line_start': item.lineStart,
                  'line_end': item.lineEnd,
                  'image': item.image,
                  'narration': item.narrationId,
                  'chapter': item.chapterId,
                  'book': item.bookId,
                  'part': item.partId,
                  'page': item.pageId,
                  'verse_number': item.verseNumber
                },
            changeListener),
        _verseDeletionAdapter = DeletionAdapter(
            database,
            'Verse',
            ['id'],
            (Verse item) => <String, Object?>{
                  'id': item.id,
                  'text': item.text,
                  'uthmanic_text': item.uthmanicText,
                  'line_start': item.lineStart,
                  'line_end': item.lineEnd,
                  'image': item.image,
                  'narration': item.narrationId,
                  'chapter': item.chapterId,
                  'book': item.bookId,
                  'part': item.partId,
                  'page': item.pageId,
                  'verse_number': item.verseNumber
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Verse> _verseInsertionAdapter;

  final UpdateAdapter<Verse> _verseUpdateAdapter;

  final DeletionAdapter<Verse> _verseDeletionAdapter;

  @override
  Future<List<Verse>> findAllVerses() async {
    return _queryAdapter.queryList('SELECT * FROM Verse',
        mapper: (Map<String, Object?> row) => Verse(
            id: row['id'] as int?,
            text: row['text'] as String?,
            uthmanicText: row['uthmanic_text'] as String?,
            lineStart: row['line_start'] as int?,
            lineEnd: row['line_end'] as int?,
            image: row['image'] as String?,
            narrationId: row['narration'] as int?,
            chapterId: row['chapter'] as int?,
            bookId: row['book'] as int?,
            partId: row['part'] as int?,
            pageId: row['page'] as int?,
            verseNumber: row['verse_number'] as int?));
  }

  @override
  Future<List<Verse>> findAllVersesPage(int page) async {
    return _queryAdapter.queryList('SELECT * FROM Verse WHERE page = ?1',
        mapper: (Map<String, Object?> row) => Verse(
            id: row['id'] as int?,
            text: row['text'] as String?,
            uthmanicText: row['uthmanic_text'] as String?,
            lineStart: row['line_start'] as int?,
            lineEnd: row['line_end'] as int?,
            image: row['image'] as String?,
            narrationId: row['narration'] as int?,
            chapterId: row['chapter'] as int?,
            bookId: row['book'] as int?,
            partId: row['part'] as int?,
            pageId: row['page'] as int?,
            verseNumber: row['verse_number'] as int?),
        arguments: [page]);
  }

  @override
  Future<List<Verse>> findAllVersesChapterPage(
      int page, int chapter, int narration, int book) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Verse WHERE page = ?1 and chapter = ?2 and narration = ?3 and book = ?4',
        mapper: (Map<String, Object?> row) => Verse(id: row['id'] as int?, text: row['text'] as String?, uthmanicText: row['uthmanic_text'] as String?, lineStart: row['line_start'] as int?, lineEnd: row['line_end'] as int?, image: row['image'] as String?, narrationId: row['narration'] as int?, chapterId: row['chapter'] as int?, bookId: row['book'] as int?, partId: row['part'] as int?, pageId: row['page'] as int?, verseNumber: row['verse_number'] as int?),
        arguments: [page, chapter, narration, book]);
  }

  @override
  Stream<Verse?> findVerseById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Verse WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Verse(
            id: row['id'] as int?,
            text: row['text'] as String?,
            uthmanicText: row['uthmanic_text'] as String?,
            lineStart: row['line_start'] as int?,
            lineEnd: row['line_end'] as int?,
            image: row['image'] as String?,
            narrationId: row['narration'] as int?,
            chapterId: row['chapter'] as int?,
            bookId: row['book'] as int?,
            partId: row['part'] as int?,
            pageId: row['page'] as int?,
            verseNumber: row['verse_number'] as int?),
        arguments: [id],
        queryableName: 'Verse',
        isView: false);
  }

  @override
  Future<void> insertVerse(Verse verse) async {
    await _verseInsertionAdapter.insert(verse, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateVerse(Verse verse) async {
    await _verseUpdateAdapter.update(verse, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteVerse(Verse verse) async {
    await _verseDeletionAdapter.delete(verse);
  }
}

class _$GlyphDao extends GlyphDao {
  _$GlyphDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _glyphInsertionAdapter = InsertionAdapter(
            database,
            'Glyph',
            (Glyph item) => <String, Object?>{
                  'id': item.id,
                  'verse': item.verseId,
                  'page': item.pageId,
                  'chapter': item.chapterId,
                  'line_number': item.lineNumber,
                  'position': item.position,
                  'minX': item.minX,
                  'maxX': item.maxX,
                  'minY': item.minY,
                  'maxY': item.maxY
                },
            changeListener),
        _glyphUpdateAdapter = UpdateAdapter(
            database,
            'Glyph',
            ['id'],
            (Glyph item) => <String, Object?>{
                  'id': item.id,
                  'verse': item.verseId,
                  'page': item.pageId,
                  'chapter': item.chapterId,
                  'line_number': item.lineNumber,
                  'position': item.position,
                  'minX': item.minX,
                  'maxX': item.maxX,
                  'minY': item.minY,
                  'maxY': item.maxY
                },
            changeListener),
        _glyphDeletionAdapter = DeletionAdapter(
            database,
            'Glyph',
            ['id'],
            (Glyph item) => <String, Object?>{
                  'id': item.id,
                  'verse': item.verseId,
                  'page': item.pageId,
                  'chapter': item.chapterId,
                  'line_number': item.lineNumber,
                  'position': item.position,
                  'minX': item.minX,
                  'maxX': item.maxX,
                  'minY': item.minY,
                  'maxY': item.maxY
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Glyph> _glyphInsertionAdapter;

  final UpdateAdapter<Glyph> _glyphUpdateAdapter;

  final DeletionAdapter<Glyph> _glyphDeletionAdapter;

  @override
  Future<List<Glyph>> findAllGlyphs() async {
    return _queryAdapter.queryList('SELECT * FROM Glyph',
        mapper: (Map<String, Object?> row) => Glyph(
            row['id'] as int?,
            row['verse'] as int?,
            row['page'] as int?,
            row['chapter'] as int?,
            row['line_number'] as int?,
            row['position'] as int?,
            row['minX'] as int?,
            row['maxX'] as int?,
            row['minY'] as int?,
            row['maxY'] as int?));
  }

  @override
  Stream<Glyph?> findGlyphById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Glyph WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Glyph(
            row['id'] as int?,
            row['verse'] as int?,
            row['page'] as int?,
            row['chapter'] as int?,
            row['line_number'] as int?,
            row['position'] as int?,
            row['minX'] as int?,
            row['maxX'] as int?,
            row['minY'] as int?,
            row['maxY'] as int?),
        arguments: [id],
        queryableName: 'Glyph',
        isView: false);
  }

  @override
  Future<void> insertGlyph(Glyph glyph) async {
    await _glyphInsertionAdapter.insert(glyph, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateGlyph(Glyph glyph) async {
    await _glyphUpdateAdapter.update(glyph, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteGlyph(Glyph glyph) async {
    await _glyphDeletionAdapter.delete(glyph);
  }
}

class _$ChaptersPageDao extends ChaptersPageDao {
  _$ChaptersPageDao(this.database, this.changeListener)
      : _chaptersPageInsertionAdapter = InsertionAdapter(
            database,
            'ChaptersPage',
            (ChaptersPage item) => <String, Object?>{
                  'id': item.id,
                  'pageId': item.pageId,
                  'chapterId': item.chapterId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<ChaptersPage> _chaptersPageInsertionAdapter;

  @override
  Future<void> insertChaptersPage(ChaptersPage chaptersPage) async {
    await _chaptersPageInsertionAdapter.insert(
        chaptersPage, OnConflictStrategy.replace);
  }
}

class _$ChapterDownloadDao extends ChapterDownloadDao {
  _$ChapterDownloadDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _chapterDownloadInsertionAdapter = InsertionAdapter(
            database,
            'ChapterDownload',
            (ChapterDownload item) => <String, Object?>{
                  'id': item.id,
                  'narrationId': item.narrationId,
                  'reciterId': item.reciterId,
                  'recitationId': item.recitationId,
                  'chapterId': item.chapterId,
                  'downloaded': item.downloaded ? 1 : 0
                },
            changeListener),
        _chapterDownloadUpdateAdapter = UpdateAdapter(
            database,
            'ChapterDownload',
            ['id'],
            (ChapterDownload item) => <String, Object?>{
                  'id': item.id,
                  'narrationId': item.narrationId,
                  'reciterId': item.reciterId,
                  'recitationId': item.recitationId,
                  'chapterId': item.chapterId,
                  'downloaded': item.downloaded ? 1 : 0
                },
            changeListener),
        _chapterDownloadDeletionAdapter = DeletionAdapter(
            database,
            'ChapterDownload',
            ['id'],
            (ChapterDownload item) => <String, Object?>{
                  'id': item.id,
                  'narrationId': item.narrationId,
                  'reciterId': item.reciterId,
                  'recitationId': item.recitationId,
                  'chapterId': item.chapterId,
                  'downloaded': item.downloaded ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ChapterDownload> _chapterDownloadInsertionAdapter;

  final UpdateAdapter<ChapterDownload> _chapterDownloadUpdateAdapter;

  final DeletionAdapter<ChapterDownload> _chapterDownloadDeletionAdapter;

  @override
  Future<List<ChapterDownload>> findAllChapterDownloads() async {
    return _queryAdapter.queryList('SELECT * FROM ChapterDownload',
        mapper: (Map<String, Object?> row) => ChapterDownload(
            id: row['id'] as int?,
            narrationId: row['narrationId'] as int?,
            reciterId: row['reciterId'] as int?,
            recitationId: row['recitationId'] as int?,
            chapterId: row['chapterId'] as int?,
            downloaded: (row['downloaded'] as int) != 0));
  }

  @override
  Stream<ChapterDownload?> findChapterDownloadById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM ChapterDownload WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ChapterDownload(
            id: row['id'] as int?,
            narrationId: row['narrationId'] as int?,
            reciterId: row['reciterId'] as int?,
            recitationId: row['recitationId'] as int?,
            chapterId: row['chapterId'] as int?,
            downloaded: (row['downloaded'] as int) != 0),
        arguments: [id],
        queryableName: 'ChapterDownload',
        isView: false);
  }

  @override
  Future<void> insertChapterDownload(ChapterDownload chapterDownload) async {
    await _chapterDownloadInsertionAdapter.insert(
        chapterDownload, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateChapterDownload(ChapterDownload chapterDownload) async {
    await _chapterDownloadUpdateAdapter.update(
        chapterDownload, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteChapterDownload(ChapterDownload chapterDownload) async {
    await _chapterDownloadDeletionAdapter.delete(chapterDownload);
  }
}
