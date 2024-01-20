import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Utilities/Services/setwallpaper.dart';
import 'package:wallpapers_app_flutter/Utilities/utils.dart';

class Services {
  static void showSimpleDialog(BuildContext context, String imgUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon:  const Icon(Icons.home,color: Color.fromARGB(255, 216, 221, 219)),
                onPressed: () {
                  //Set Wallpaper Code
                  SetWallPaper setWallPaper = SetWallPaper(imgurl: imgUrl);
                  setWallPaper.setWallpaer(1).then((value) {
                    Navigator.of(context).pop();
                    Utils.ShowFlutterToast('Wallpaper Changed',
                        const Color.fromARGB(255, 3, 177, 108));
                  }).onError((error, stackTrace) {
                    Utils.ShowFlutterToast('SomeThing Went Wrong \n$error',
                        const Color.fromARGB(255, 189, 2, 2));
                  });
                },
                label: const Text(
                  'Home Screen',
                  style: TextStyle(color: Color.fromARGB(255, 3, 177, 108)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.lock,color:  Color.fromARGB(255, 216, 221, 219),),
                onPressed: () {
                  SetWallPaper setWallPaper = SetWallPaper(imgurl: imgUrl);
                  setWallPaper.setWallpaer(2).then((value) {
                    Navigator.of(context).pop(); //
                    Utils.ShowFlutterToast('Wallpaper Changed',
                        const Color.fromARGB(255, 3, 177, 108));
                  }).onError((error, stackTrace) {
                    Utils.ShowFlutterToast('SomeThing Went Wrong \n$error',
                        const Color.fromARGB(255, 189, 2, 2));
                  });
                },
                label: const Text(
                  'Lock Screen',
                  style: TextStyle(color: Color.fromARGB(255, 3, 177, 108)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
