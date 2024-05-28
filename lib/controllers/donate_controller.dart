import 'package:blood_bank/data/models/Donate.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String donateTable = 'donateTable';
const String idColumn = 'idColumn';
const String nameColumn = 'nameColumn';
const String bloodColumn = 'bloodColumn';
const String numberColumn = 'numberColumn';
const String dateColumn = 'dateColumn';
const String streetColumn = 'streetColumn';
const String districtColumn = 'districtColumn';
const String clinicColumn = 'clinicColumn';
const String doctorColumn = 'doctorColumn';
const String statusColumn = 'statusColumn';

class DonateController {
  static final DonateController _instance = DonateController.internal();

  factory DonateController() => _instance;

  DonateController.internal();

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
    final path = join(databasePath, "donates.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $donateTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $bloodColumn TEXT, $streetColumn TEXT, $districtColumn TEXT,"
          "$numberColumn TEXT, $clinicColumn TEXT, $dateColumn TEXT, $doctorColumn TEXT, $statusColumn TEXT)");
    });
  }

  Future<Donate> saveDonate(Donate donate) async {
    Database dbDonate = await db;
    donate.id = await dbDonate.insert(donateTable, donate.toMap());

    return donate;
  }

  Future<dynamic> getDonate(int id) async {
    Database dbDonate = await db;
    List<Map> maps = await dbDonate.query(donateTable,
        columns: [
          idColumn,
          nameColumn,
          bloodColumn,
          streetColumn,
          districtColumn,
          numberColumn,
          clinicColumn,
          doctorColumn,
          statusColumn,
          dateColumn,
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Donate.fromMap(maps.first);
    } else {
      return null;
    }
  }

    Future<dynamic> getDonateStatus(String status) async {
    Database dbDonate = await db;
    List<Map> maps = await dbDonate.query(donateTable,
        columns: [
          idColumn,
          nameColumn,
          bloodColumn,
          streetColumn,
          districtColumn,
          numberColumn,
          clinicColumn,
          doctorColumn,
          statusColumn,
          dateColumn,
        ],
        where: "$statusColumn = ?",
        orderBy: dateColumn,
        whereArgs: [status]);
    if (maps.length > 0) {
      List<Donate> list = [];
      for (var i = 0; i < maps.length; i++) {
        list.add(Donate.fromMap(maps[i]));
      }
      return list;
    } else {
      return null;
    }
  }

  Future<int> deleteDonate(int id) async {
    Database dbDonate = await db;
    return await dbDonate
        .delete(donateTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateDonate(Donate donate) async {
    Database dbDonate = await db;
    return await dbDonate.update(donateTable, donate.toMap(),
        where: "$idColumn = ?", whereArgs: [donate.id]);
  }

  Future<List> getAllDonate() async {
    Database dbDonate = await db;
    List listMap = await dbDonate.rawQuery("SELECT * FROM $donateTable");
    List<Donate> listDonate = [];
    for (Map m in listMap) {
      listDonate.add(Donate.fromMap(m));
    }
    return listDonate;
  }

  Future<int?> getNumber() async {
    Database dbDonate = await db;
    return Sqflite.firstIntValue(
        await dbDonate.rawQuery("SELECT COUNT(*) FROM $donateTable"));
  }

  Future close() async {
    Database dbDonate = await db;
    dbDonate.close();
  }

  Future deleteAll() async {
    Database dbDonate = await db;
    dbDonate.execute('DELETE FROM $donateTable');
  }
}

