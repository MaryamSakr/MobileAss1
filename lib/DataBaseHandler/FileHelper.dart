import 'dart:io';

import 'package:first_assiment/moduls/student.dart';
import 'package:path_provider/path_provider.dart';

class localStorge{
  Future<String> getLocalPath() async{
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }

  Future<File> getLocalFile() async{
    String path = await getLocalPath();
    return File('$path/student.txt');
  }

  Future<File> writeStudent(Student student) async{
    File file = await getLocalFile();
    String name = student.name!;
    String mail = student.email!;
    String studentID = student.studentID!;
    String gender = student.gender!;
    String level = student.level!;
    String password = student.password!;
    return file.writeAsString('$name||$mail||$studentID||$gender||$level||$password');
  }
  Future<bool> readStudents(String name,String passwrod) async {
    List<Student> students = [];
    try {
      File file = await getLocalFile();
      List<String> lines = await file.readAsLines();
      for (String line in lines) {
        List<String> parts = line.split('||');
        if (parts.length >= 6) {
         Student student = Student(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5],);
          if(student.name == name && student.password == passwrod){
            return true;
          }
        }
      }
    } catch (e) {
      print("Error reading student data: $e");
    }
    return false;
  }

}