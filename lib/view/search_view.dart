import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/search_bar.dart';
import 'package:wallpapers_app_flutter/Resources/components/search_Grid.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/View%20Model/search_viewmodel.dart';

class SearchView extends StatelessWidget {
  final Isvisibel? isvisit;
  const SearchView({Key? key, required this.isvisit, Object? args})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () {
          return Future.delayed(const Duration(milliseconds: 1200), () {
            Provider.of<SearchModel>(context, listen: false)
                .fetchSearchresult(context);
          });
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  isvisit!.isvible
                      ? searchBar(true, context)
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 5,
                  ),
                  Consumer<SearchModel>(
                    builder: (_, value, __) => value.hit
                        ? const SearchGrid()
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 50),
                            child: Center(
                                child: isvisit!.isvible
                                    ? const Text('Search Something')
                                    : const SizedBox.shrink())),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
