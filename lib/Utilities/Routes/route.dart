import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/Utilities/Routes/route_name.dart';
import 'package:wallpapers_app_flutter/view/category_view.dart';
import 'package:wallpapers_app_flutter/view/home_view.dart';
import 'package:wallpapers_app_flutter/view/image_view.dart';
import 'package:wallpapers_app_flutter/view/search_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutNames.home_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      case RoutNames.search_bar:
        final args = settings.arguments as Isvisibel?;
        return MaterialPageRoute(
            builder: (BuildContext context) => SearchView(
                  isvisit: args,
                ));
      case RoutNames.img_view:
        final arg = settings.arguments as ImageViewArguments?;
        return MaterialPageRoute(
          builder: (BuildContext context) => ImageView(args: arg),
        );
      case RoutNames.CATEGORY_VIEW:
        final args = settings.arguments as ImageViewArguments?;
        return MaterialPageRoute(
          builder: (BuildContext context) => CategoryView(title: args),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Text('No Such Route Found'),
          );
        });
    }
  }
}
