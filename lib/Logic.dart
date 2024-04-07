import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


// https://login-signup.p.rapidapi.com/public/v1/login.php
// https://reqres.in/api/login
void login(String username, String password) async {
  try {
    Response response = await post(
      Uri.parse('https://reqres.in/api/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      // print(data['token']);
      print('Login successfully');
    }
    else {
      print('Failed');
    }

  } catch (e) {
    print(e.toString());
  }
}

