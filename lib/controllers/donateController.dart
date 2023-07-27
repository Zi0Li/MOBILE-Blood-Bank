import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String donateTable = 'donateTable';
final String idColumn = 'idColumn';
final String numberColumn = 'numberColumn';
final String dateColumn = 'dateColumn';
final String streetColumn = 'streetColumn';
final String districtColumn = 'districtColumn';
final String clinicColumn = 'clinicColumn';

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
    final path = join(databasePath, 'donate.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $donateTable($idColumn INTEGER PRIMARY KEY, $numberColumn INTERGER, $dateColumn TEXT,"
          "$streetColumn TEXT, $districtColumn TEXT, $clinicColumn TEXT)");
    });
  }

  Future<Donate> saveDonate(Donate donate) async {
    Database dbDonate = await db;
    donate.id = await dbDonate.insert(donateTable, donate.toMap());

    return donate;
  }

  Future<dynamic> getDonate(int id) async {
    Database dbDonate = await db;
    List<Map> map = await dbDonate.query(donateTable,
        columns: [
          idColumn,
          numberColumn,
          dateColumn,
          streetColumn,
          districtColumn,
          clinicColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (map.length > 0) {
      return Donate.fromMap(map.first);
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
        where: '$idColumn = ?', whereArgs: [donate.id]);
  }

  Future<List> getAllDonate() async {
    Database dbDonate = await db;
    List listMap = await dbDonate.rawQuery('SELECT * FROM $donateTable');
    List<Donate> listDonate = [];
    for (Map m in listMap) {
      listDonate.add(Donate.fromMap(m));
    }
    return listDonate;
  }


  Future deleteAll() async{
    Database dbDonate = await db;
    dbDonate.execute('DELETE FROM $donateTable');
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
}

class Donate {
  int? id;
  int? number;
  String? date;
  String? street;
  String? district;
  String? clinic;

  Donate();

  Donate.fromMap(Map map) {
    id = map[idColumn];
    number = map[numberColumn];
    date = map[dateColumn];
    street = map[streetColumn];
    district = map[districtColumn];
    clinic = map[clinicColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      numberColumn: number,
      dateColumn: date,
      streetColumn: street,
      districtColumn: district,
      clinicColumn: clinic,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Donate(id: $id, date: $date, number: $number, street: $street, district: $district, clinic: $clinic)";
  }
}
