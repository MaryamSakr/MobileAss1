// "email": "eve.holt@reqres.in",
// "password": "cityslicka"

import 'SignUp.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'DataBaseHandler/FileHelper.dart';
import 'getFormTextField.dart';
import 'moduls/student.dart';

class Login extends StatefulWidget {
  static String id = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var file;
  @override
  void initState(){
    super.initState();
    file = localStorge();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(color: Colors.indigo,
            fontWeight: FontWeight.bold , fontSize: 25),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getTextFormField(
                controller: usernameController,
                icon: Icons.person,
                hintName: 'E-mail'
            ),
            const SizedBox(height: 20),
          getTextFormField(
            controller: passwordController,
            icon: Icons.lock,
            hintName: 'password',
            isObscureText: true,
          ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () async {
                localStorge local = localStorge();
                bool isLoggedIn = await local.readStudents(usernameController.text, passwordController.text);
                print("Is logged in: $isLoggedIn");

                if (isLoggedIn) {
                  Student std = await local.getData(usernameController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(name: std.name,id: std.studentID , email: std.email,Gender: std.gender, Level: std.level,user: usernameController.text , Pass: passwordController)));                }

               else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Invalid Credentials"),
                        content: Text("Please rewrite your email and password."),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }






                // if(isLoggedIn){
                //   Student std = await local.getData(usernameController.text);
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(name: std.name,id: std.studentID , email: std.email,Gender: std.gender, Level: std.level,user: usernameController.text)));                }
                // login(
                //   usernameController.text.toString(),
                //   passwordController.text.toString(),
                // );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:const Center(
                  child: Text('Login',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: const Text('Sign up',style: TextStyle(color: Colors.blue),)
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
