import 'package:first_assiment/DataBaseHandler/FileHelper.dart';
import 'package:first_assiment/alertDialog.dart';
import 'package:first_assiment/moduls/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataBaseHandler/DBHelper.dart';
import 'getFormTextField.dart';

class SignupScreen extends StatefulWidget {
  static String id='SignUpScreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _gender = '';
  String _level = '';
  final _studentID = TextEditingController();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _conPassword = TextEditingController();
  List<String> _genders =["Male" ,"Female"];
  List<String> _levels =['1','2','3','4'];
  var dbHelper ;
  var file;
  @override
  void initState(){
    super.initState();
    dbHelper = DBHelper();
    file = localStorge();
}

  SignUp() async {
    String name = _name.text;
    String gender = _gender;
    String email = _email.text;
    String studentID = _studentID.text;
    String level = _level;
    String password = _password.text;
    String conPassword = _conPassword.text;
    if (_globalKey.currentState!.validate()) {
      if (password != conPassword) {
        alertDialog(context, 'Password Mismatch');
      } else {
        _globalKey.currentState!.save();
        Student student = Student(name, gender, email, studentID, level, password);
        file.writeStudent(student).then((data){
          Navigator.pop(context);
        });

        // await dbHelper.saveData(student).then((studentData) {
        //   alertDialog(context, "Successfully Saved");
        //   Navigator.pop(context);
        // }).catchError((error) {
        //   print(error);
        //   alertDialog(context, "Error: Data Save Fail");
        // });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign up",
            style: TextStyle(color: Colors.blue,
                fontWeight: FontWeight.bold),),
        ),
        body: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     getTextFormField(
                          controller: _name,
                          icon: Icons.person,
                          hintName: 'User name'
                      ),
                    SizedBox(height: 10,),
                    getTextFormField(
                        controller: _email,
                        icon: Icons.mail,
                        hintName: 'studentID@stud.fci-cu.edu.eg'
                    ),
                    SizedBox(height: 10,),
                    getTextFormField(
                        controller: _studentID,
                        icon: Icons.info,
                        hintName: 'student id',
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal:40),
                      child:
                        Text('Gender'),
                    ),
                    for(int i=0;i < _genders.length; i++)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Radio(value: _genders[i].toString(),
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value.toString();
                                });
                              },),
                            Text(_genders[i]),
                          ],
                        ),
                      ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal:40),
                      child:
                      Text('Level'),
                    ),
                    for(int i=0;i < _levels.length; i++)
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Radio(value: _levels[i].toString(),
                              groupValue: _level,
                              onChanged: (value) {
                                setState(() {
                                  _level = value.toString();
                                });
                              },),
                            const Text("Level "),
                            Text(_levels[i]),
                          ],
                        ),
                      ),
                    SizedBox(height: 10,),
                    getTextFormField(
                      controller: _password,
                      icon: Icons.lock,
                      hintName: 'password',
                        isObscureText: true,
                    ),
                    SizedBox(height: 10,),
                    getTextFormField(
                      controller: _conPassword,
                      icon: Icons.lock,
                      hintName: 'confirm password',
                        isObscureText: true,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (){
                            SignUp();
                    }, child:const Text('Sign up',style: TextStyle(color: Colors.blue),),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        SizedBox(width: 5,),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:const Text('Log in',style: TextStyle(color: Colors.blue),)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
