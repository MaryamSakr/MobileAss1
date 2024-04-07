import 'package:first_assiment/Login.dart';
import 'package:first_assiment/SignUp.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        SignupScreen.id : (context) => SignupScreen(),
        Login.id : (context) => Login(),
      },
      home: Login(),
    );
  }
}


