import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
class DBHelper{
  static Database? _database;
  static const String DB_Name = 'test.db';
  static const String Table_Student = 'student';
  static const int version =1;
  static const String C_name = 'name';
  static const String C_mail = 'mail';
  static const String C_studentID = 'studentID';
  static const String C_gender = 'gender';
  static const String C_level = 'level';
  static const String C_password = 'password';


  Future<Database> get db async{
    if(_database != null){
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }
  initDb() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,DB_Name);
    var db = await openDatabase(path , version: version, onCreate:  _onCreate);
    return db;
  }

  _onCreate(Database db , int intversion) async{
    await db.execute('CREATE TABLE $Table_Student('
        '$C_name TEXT,'
        '$C_mail TEXT,'
        '$C_gender TEXT,'
        '$C_studentID TEXT,'
        '$C_level TEXT,'
        '$C_password TEXT'
        'PRIMARY KEY ($C_studentID'
        ')');
  }
}