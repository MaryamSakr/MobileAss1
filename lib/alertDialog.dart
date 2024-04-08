import 'package:flutter/material.dart';

alertDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text(msg),
      );
    },
  );
}

void showToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3), // Adjust the duration as needed
    ),
  );
}
