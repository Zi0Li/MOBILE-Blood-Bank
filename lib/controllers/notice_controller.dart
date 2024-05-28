import 'package:blood_bank/data/models/Notice.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String noticeTable = 'noticeTable';
const String id = 'id';
const String title = 'title';
const String slug = 'slug';
const String subtitle = 'subtitle';
const String lead = 'lead';
const String body = 'body';
const String view = 'view';
const String created_at = 'created_at';
const String updated_at = 'updated_at';
const String idColumn = 'idColumn';
const String titleColumn = 'titleColumn';
const String textColumn = 'textColumn';
const String dateColumn = 'dateColumn';

class NoticeController {
  static final NoticeController _instance = NoticeController.internal();

  factory NoticeController() => _instance;

  NoticeController.internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'notices.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int neweVersion) async {
      await db.execute(
          "CREATE TABLE $noticeTable($id INTEGER PRIMARY KEY, $title TEXT, $slug TEXT, $subtitle TEXT, $lead TEXT, $body TEXT,"
          "$view INTEGER, $created_at TEXT, $updated_at TEXT)");
    });
  }

  Future<Notice> saveNotice(Notice notice) async {
    Database dbNotice = await db;
    notice.id = await dbNotice.insert(noticeTable, notice.toMap());

    return notice;
  }

  Future<dynamic> getNotice(int id) async {
    Database dbNotice = await db;
    List<Map> maps = await dbNotice.query(noticeTable,
        columns: [idColumn, titleColumn, textColumn, dateColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Notice.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteNotice(int id) async {
    Database dbNotice = await db;
    return await dbNotice
        .delete(noticeTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateNotice(Notice notice) async {
    Database dbNotice = await db;
    return await dbNotice.update(noticeTable, notice.toMap(),
        where: "$idColumn=?", whereArgs: [notice.id]);
  }

  Future<List> getAllNotice() async {
    Database dbNotice = await db;
    List listMap = await dbNotice.rawQuery("SELECT * FROM $noticeTable");
    List<Notice> listNotice = [];
    for (Map m in listMap) {
      listNotice.add(Notice.fromMap(m));
    }
    return listNotice;
  }

  Future<int?> getNumber() async {
    Database dbNotice = await db;
    return Sqflite.firstIntValue(
        await dbNotice.rawQuery("SELECT COUNT(*) FROM $noticeTable"));
  }

  Future close() async {
    Database dbNotice = await db;
    dbNotice.close();
  }

  Future deletaAll() async {
    Database dbnotice = await db;
    dbnotice.execute("DELETE FROM $noticeTable");
  }
}
