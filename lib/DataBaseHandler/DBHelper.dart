import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../moduls/student.dart';

class DBHelper{
  static Database _database = DBHelper._database;
  static const String DB_Name = 'studentForm.db';
  static const String Table_Student = 'student';
  static const int version =1;
  static const String C_name = 'name';
  static const String C_mail = 'email';
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
    String documentDirectory = await getDatabasesPath();
    String path = join(documentDirectory,DB_Name);
    var db = await openDatabase(path , onCreate:  _onCreate);
    return db;
  }

  _onCreate(Database db , int intversion) async{
    await db.execute('CREATE TABLE $Table_Student('
        '$C_name TEXT NOT NULL,'
        '$C_mail TEXT NOT NULL,'
        '$C_gender TEXT,'
        '$C_studentID TEXT NOT NULL,'
        '$C_level TEXT,'
        '$C_password TEXT NOT NULL'
        'PRIMARY KEY ($C_name)'
        ')');
  }

   SaveData(Student student)async{
    var dbClient = await db;
    String name = student.name!;
    String mail = student.email!;
    String studentID = student.studentID!;
    String gender = student.gender!;
    String level = student.level!;
    String password = student.password!;
    int respone = await dbClient.rawInsert('INSERT INTO $Table_Student'
        '($C_name,$C_mail,$C_studentID,$C_gender,$C_level,$C_password) '
        'VALUES($name,$mail,$studentID,$gender,$level,$password)');
    return respone;
  }

  Future<Student?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_Student WHERE "
        "$C_name = '$userId' AND "
        "$C_password = '$password'");
    if (res.length > 0) {
      return Student.fromMap(res.first);
    }
    return null;
  }

  Future<int> updateUser(Student student) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_Student, student.toMap(),
        where: '$C_name = ?', whereArgs: [student.name]);
    return res;
  }

}