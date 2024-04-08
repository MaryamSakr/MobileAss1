import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void alertDialog(BuildContext context, String msg) {
  Toast.show(msg, textStyle: context, duration: Toast.lengthLong, gravity: Toast.bottom);
}