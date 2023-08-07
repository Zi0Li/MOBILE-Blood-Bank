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
          "CREATE TABLE $donateTable($idColumn INTEGER PRIMARY KEY, , $nameColumn TEXT, $bloodColumn TEXT, $streetColumn TEXT, $districtColumn TEXT,"
          "$numberColumn INTEGER, $clinicColumn TEXT, $dateColumn TEXT), $doctorColumn TEXT)");
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

class Donate {
  int? id;
  int? number;
  String? name;
  String? blood;
  String? date;
  String? street;
  String? district;
  String? clinic;
  String? doctor;

  Donate();

  Donate.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    blood = map[bloodColumn];
    number = map[numberColumn];
    date = map[dateColumn];
    street = map[streetColumn];
    district = map[districtColumn];
    clinic = map[clinicColumn];
    doctor = map[doctorColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      streetColumn: street,
      nameColumn: name,
      bloodColumn: blood,
      districtColumn: district,
      numberColumn: number,
      dateColumn: date,
      clinicColumn: clinic,
      doctorColumn: doctor,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Donate(id: $id,date: $date,name: $name,blood: $blood, number: $number, street: $street, district: $district, clinic: $clinic, doctor: $doctor)";
  }
}
