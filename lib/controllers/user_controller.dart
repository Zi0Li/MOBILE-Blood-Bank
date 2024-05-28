import 'package:blood_bank/data/models/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserController {
  static final UserController _instance = UserController.internal();

  factory UserController() => _instance;

  UserController.internal();  

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
    final path = join(databasePath, "users.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $userTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $bloodColumn TEXT, $birthColumn TEXT, $numberColumn INTEGER,"
          "$tattooColumn INTEGER, $imageColumn TEXT, $pigmentationColumn INTEGER, $makeupColumn INTEGER, $statesColumn TEXT, $blood_centerColumn TEXT)");
    });
  }

  Future<User> saveUser(User user) async {
    Database dbUser = await db;
    user.id = await dbUser.insert(userTable, user.toMap());

    return user;
  }

  Future<dynamic> getUser() async {
    Database dbUser = await db;

    List<Map> maps = await dbUser.query(userTable,
        columns: [
          idColumn,
          nameColumn,
          bloodColumn,
          numberColumn,
          birthColumn,
          tattooColumn,
          pigmentationColumn,
          makeupColumn,
          imageColumn,
          statesColumn,
          blood_centerColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [1]);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int?> getNumber() async {
    Database dbUser = await db;
    return Sqflite.firstIntValue(
        await dbUser.rawQuery("SELECT COUNT(*) FROM $userTable"));
  }

  Future<int> deleteUser(int id) async {
    Database dbUser = await db;
    return await dbUser
        .delete(userTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    Database dbUser = await db;
    return await dbUser.update(userTable, user.toMap(),
        where: "$idColumn = ?", whereArgs: [user.id]);
  }

  Future close() async {
    Database dbUser = await db;
    dbUser.close();
  }

}
