import 'dart:io';
import 'package:first_assiment/moduls/student.dart';
import 'package:path_provider/path_provider.dart';

class localStorge {
  Future<String> getLocalPath() async {
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }

  Future<File> getLocalFile() async {
    String path = await getLocalPath();
    return File('$path/student.txt');
  }


  Future<void> appendToFile(String data) async {
    String filePath = 'path/to/your/file.txt'; // Specify the file path
    File file = File(filePath);
    IOSink? sink;

    try {
      sink = file.openWrite(mode: FileMode.append);
      sink.writeln(data); // Write data to the file, followed by a newline
      await sink.flush(); // Flush the data to ensure it's written immediately
    } catch (e) {
      print('Error appending to file: $e');
    } finally {
      await sink?.close(); // Close the sink to release the resources
    }
  }

  Future<File> writeStudent(Student student) async {
    File file = await getLocalFile();
    String name = student.name!;
    String mail = student.email!;
    String studentID = student.studentID!;
    String gender = student.gender!;
    String level = student.level!;
    String password = student.password!;
    IOSink? sink;
      sink = file.openWrite(mode: FileMode.append);
      sink.writeln('$name||$mail||$studentID||$gender||$level||$password');
      await sink.flush(); // Flush the data to ensure it's written immediately

    return file;
  }

  Future<bool> readStudents(String email, String password) async {
    try {
      File file = await getLocalFile();
      List<String> lines = await file.readAsLines();
      for (String line in lines) {
        print("Line: $line");
        List<String> parts = line.split('||');
        if (parts.length >= 6) {
          Student student = Student(
            parts[0],
            parts[1],
            parts[2],
            parts[3],
            parts[4],
            parts[5],
          );
          if (student.studentID == email && student.password == password) {
            print("Match found!");
            return true;
          } else {
            print('nooooo match');
          }
        }
      }
    } catch (e) {
      print("Error reading student data: $e");
    }
    return false;
  }


  Future<Student> getData(String name) async {
    Student std = Student(null, null, null, null, null, null);
    try {
      File file = await getLocalFile();
      List<String> lines = await file.readAsLines();
      for (String line in lines) {
        List<String> parts = line.split('||');
        if (parts.length >= 6) {
          Student student = Student(
            parts[0], parts[1], parts[2], parts[3], parts[4], parts[5],);
          if (student.studentID == name) {
            return student;
          }
        }
      }
    } catch (e) {
      print("Error reading student data: $e");
    }
    return std;
  }


  Future<void> UpdateStudent(String email, Student std) async {
    try {
      File file = await getLocalFile();
      List<String> lines = await file.readAsLines();
      for (String line in lines) {
        print("Line: $line");
        List<String> parts = line.split('||');
        if (parts.length >= 6) {
          Student student = Student(
            parts[0],
            parts[1],
            parts[2],
            parts[3],
            parts[4],
            parts[5],
          );
          if (student.studentID == email) {
            student.level = std.level;
            student.email = std.email;
            student.gender = std.gender;
            student.studentID = std.studentID;
            student.name = std.name;
            print("Match found!");
          }
        }
      }
    } catch (e) {
      print("Error reading student data: $e");
    }
  }


  Future<bool> checkID(String ID) async {
    try {
      File file = await getLocalFile();
      List<String> lines = await file.readAsLines();
      for (String line in lines) {
        List<String> parts = line.split('||');
        if (parts.length >= 6) {
          Student student = Student(
            parts[0], parts[1], parts[2], parts[3], parts[4], parts[5],);
          if (student.gender == ID) {
            return false;
          }
        }
      }
    } catch (e) {
      print("Error reading student data: $e");
    }
    return true;
  }
}