import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Providers/home_provider.dart';
import 'package:wallpapers_app_flutter/Utilities/Routes/route.dart';
import 'package:wallpapers_app_flutter/Utilities/Routes/route_name.dart';
import 'package:wallpapers_app_flutter/View%20Model/category_v_model.dart';
import 'package:wallpapers_app_flutter/View%20Model/home_model.dart';
import 'package:wallpapers_app_flutter/View%20Model/search_viewmodel.dart';
import 'package:wallpapers_app_flutter/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(create: (__) => SearchModel()),
        ChangeNotifierProvider(create: (__) => CategoryViewModel()),
        ChangeNotifierProvider(create: (__) => HomeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.pink,
          useMaterial3: true,
        ),
        initialRoute: RoutNames.home_view,
        onGenerateRoute: Routes.generateRoutes,
        home: const HomeView(),
      ),
    );
  }
}