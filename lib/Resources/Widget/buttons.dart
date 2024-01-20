import 'package:flutter/material.dart';

Widget buttons(
      BuildContext context, String title, Icon icon, VoidCallback onPress) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.5,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.5),
          border: Border.all(color: Colors.grey,width: 2),
          borderRadius: BorderRadius.circular(18)),
      child: Center(
          child: FittedBox(
        child: TextButton.icon(
          
          label: Text(title,style: const TextStyle(color:  Color.fromARGB(255, 3, 177, 108)),),
          icon: icon,
          
          onPressed: onPress,
        ),
      )),
    );
  }