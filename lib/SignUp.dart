import 'package:first_assiment/Login.dart';
import 'package:first_assiment/alertDialog.dart';
import 'package:first_assiment/moduls/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataBaseHandler/DBHelper.dart';

class SignupScreen extends StatefulWidget {
  static String id='SignUpScreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _name = '';
  String _gender = '';
  String _email = '';
  String _studentID = '';
  String _level = '';
  String _password = '';
  String _confirmPassword = '';
  RegExp get _emailRegex => RegExp(r'^\S+@stud.fci-cu.edu.eg');
  List<String> _genders =["Male" ,"Female"];
  List<String> _levels =['1','2','3','4'];
  var dbHelper ;
  @override
  void initState(){
    super.initState();
    dbHelper = DBHelper();
}

  Future<void> SignUp() async {
    String name = _name;
    String gender = _gender;
    String email = _email;
    String studentID = _studentID;
    String level = _level;
    String password = _password;

    _globalKey.currentState!.save();
    Student student = Student(name, gender, email, studentID, level, password);
    await dbHelper.saveData(student).then((userData) {
      // showToast(context,'successfully sign up' );
      SnackBar(
        content: Text('successfully sign up'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      );
      Navigator.pop(context);
    }).catchError((error) {
      print(error);
      showToast(context,"Error: Data Save Fail");
    });
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'user name',
                          fillColor: Colors.grey,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'studentID@stud.fci-cu.edu.eg',
                          fillColor: Colors.grey,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }else if (!_emailRegex.hasMatch(value)){
                            return 'Email address is not valid\n It should be FCI Email structure';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.only(top: 10),
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration:const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.info),
                          hintText: 'student id',
                          fillColor: Colors.grey,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your ID';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _studentID = value!;
                        },
                      ),
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
                    Container(
                      margin:const EdgeInsets.only(top: 10),
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration:const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'password',
                          fillColor: Colors.grey,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }else if(value.length < 8){
                            return 'Password should be at least 8 characters';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.only(top: 10),
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration:const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'confirm password',
                          fillColor: Colors.grey,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !(value == _password)) {
                            return 'Password not match';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword = value!;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (){
                      if(_globalKey.currentState!.validate()){
                        _globalKey.currentState!.validate();
                      }else{
                        SignUp();
                        Navigator.pop(context,Login.id);
                      }
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
