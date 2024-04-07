import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static String id='SignUpScreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _gender = '';
  String _email = '';
  String _studentID = '';
  String _level = '';
  String _password = '';
  String _confirmPassword = '';
  RegExp get _emailRegex => RegExp(r'^\S+@stud.fci-cu.edu.eg');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 80),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign up",
                    style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(top: 40),
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
                          fillColor: Colors.green,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name != value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'studentID@stud.fci-cu.edu.eg',
                          fillColor: Colors.green,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter your email';
                          }else if (!_emailRegex.hasMatch(value)){
                            return 'Email address is not valid';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email != value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                          prefixIcon: Icon(Icons.info),
                          hintText: 'student id',
                          fillColor: Colors.green,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter your ID';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _studentID != value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
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
                          fillColor: Colors.green,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password != value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
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
                          fillColor: Colors.green,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter your password again';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword != value;
                        },
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        var snackBar= const SnackBar(content: Text('Success'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
                      }
                      else{
                        var snackBar= const SnackBar(content: Text('failed'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }, child: Text('Sign up'),
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
