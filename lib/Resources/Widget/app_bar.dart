import 'package:flutter/material.dart';

Widget customAppbar() {
  return const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
    CircleAvatar(
      radius: 25,
      backgroundColor: Color.fromARGB(255, 3, 177, 108),
      child: FittedBox(
        child: Text(
                  'P',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
      ),
    ),
    SizedBox(
      width: 3,
    ),
    Text(
      'ixels.com',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,letterSpacing: 2),
    )
  ]);
}
