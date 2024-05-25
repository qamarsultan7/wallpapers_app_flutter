// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void ShowFlutterToast(String title, Color color) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG, // or Toast.LENGTH_LONG
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: color,

      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
