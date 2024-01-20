import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/buttons.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/Utilities/Services/dialog_box.dart';
import 'package:wallpapers_app_flutter/Utilities/Services/save_to_gallery.dart';
import 'package:wallpapers_app_flutter/Utilities/utils.dart';

class ImageView extends StatelessWidget {
  final ImageViewArguments? args;
  const ImageView({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(args!.imageUrl.toString()),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buttons(
                  context,
                  'Set as a Wallpaper',
                  const Icon(
                    Icons.wallpaper,
                    color: Color.fromARGB(255, 216, 221, 219),
                  ), () {
                // Show Dialoge tO Select Either Home Screen Or Lock screen
                Services.showSimpleDialog(context, args!.imageUrl);
              }),
              const SizedBox(
                height: 7,
              ),
              buttons(
                  context,
                  'Save in Gallery',
                  const Icon(
                    Icons.download,
                    color: Color.fromARGB(255, 216, 221, 219),
                  ), () {
                // Save To Gallery
                SaveToGallery saveToGallery =
                    SaveToGallery(imageUrl: args!.imageUrl);
                saveToGallery.saveToGallery(context).then((value) {
                  Utils.ShowFlutterToast('Saved To Gallery',
                      const Color.fromARGB(255, 3, 177, 108));
                }).onError((error, stackTrace) {
                  Utils.ShowFlutterToast('SomeThing Went Wrong \n$error',
                      const Color.fromARGB(255, 189, 2, 2));
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
