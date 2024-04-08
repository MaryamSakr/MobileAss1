import 'package:flutter/material.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  RegExp get _emailRegex => RegExp(r'^\S+@stud.fci-cu.edu.eg');
  getTextFormField(
      {required this.controller,
        required this.hintName,
        required this.icon,
        this.isObscureText = false,
    });
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if(hintName == 'studentID@stud.fci-cu.edu.eg'){
              return 'Please enter your E-mail';
            }
            return 'Please enter $hintName';
          } else if(hintName == 'passord' && value.length<8){
            return 'Password should be at least 8 characters';
          }else if (!_emailRegex.hasMatch(value) && hintName == 'studentID@stud.fci-cu.edu.eg'){
            return 'Email address is not valid\n It should be FCI Email structure';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}