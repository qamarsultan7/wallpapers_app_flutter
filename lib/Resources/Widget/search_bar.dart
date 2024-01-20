import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Providers/home_provider.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/Utilities/Routes/route_name.dart';
import 'package:wallpapers_app_flutter/View%20Model/search_viewmodel.dart';

Widget searchBar(bool isReadOnly, BuildContext context) {
  final hitSearchapi = Provider.of<SearchModel>(context, listen: false);
  return InkWell(
    onTap: () {
      final args = Isvisibel(isvible: true);
      Navigator.pushNamed(context, RoutNames.search_bar, arguments: args);
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: isReadOnly
            ? TextField(
                keyboardAppearance: Brightness.dark,
                controller:
                    Provider.of<HomeProvider>(context, listen: false).searchtxt,
                decoration: InputDecoration(
                  hintText: 'Search here',
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .searchtxt
                          .clear();
                      hitSearchapi.fetchSearchresult(context);
                    },
                    child: const Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                ),
                onSubmitted: (String value) {
                  hitSearchapi.fetchSearchresult(context).then((value) {});
                },
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search Here',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.search)
                ],
              ),
      ),
    ),
  );
}
