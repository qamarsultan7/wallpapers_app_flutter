import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveToGallery {
  String imageUrl;
  SaveToGallery({required this.imageUrl});
  String fileName =
      'Wallpaper${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(9999)}.png';

  Future<void> saveToGallery(BuildContext context) async {
    final response = await http
        .get(Uri.parse(imageUrl))
        .timeout(const Duration(seconds: 12));
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_image.png');
    await tempFile.writeAsBytes(response.bodyBytes);

    if (await _permissionGrant(Permission.manageExternalStorage, context)) {
      try {
        Directory? external = await getExternalStorageDirectory();
        if (external != null) {
          Directory dir = Directory('/storage/emulated/0/Wallpapers');
          if (!await dir.exists()) {
            await dir.create(recursive: true);
          }
          if (await dir.exists()) {
            File finalFile = File('${dir.path}/$fileName');
            await tempFile.copy(finalFile.path);
            print('Saved Successfully at ${finalFile.path}');
          } else {
            print('No directory Found');
          }
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  Future<bool> _permissionGrant(
      Permission permission, BuildContext context) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.denied) {
        await openAppSettings().then((value) {
          return true;
        });
      }
    }
    return false;
  }
}
