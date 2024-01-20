import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class SetWallPaper {
  String imgurl;
  SetWallPaper({required this.imgurl});

  Future<void> setWallpaer(int x) async {
    try {
      int homeScreen = WallpaperManager.HOME_SCREEN;
      final file = await DefaultCacheManager().getSingleFile(imgurl);
      if (x == 1) {
        await WallpaperManager.setWallpaperFromFile(file.path, homeScreen)
            .then((value) {});
      } else {
        await WallpaperManager.setWallpaperFromFile(file.path, homeScreen);
      }
    } catch (e) {
      print('Here here $e');
    }
  }
}
