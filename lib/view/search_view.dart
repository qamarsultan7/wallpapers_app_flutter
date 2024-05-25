// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Providers/home_provider.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/search_bar.dart';
import 'package:wallpapers_app_flutter/Resources/components/search_Grid.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/View%20Model/search_viewmodel.dart';

class SearchView extends StatefulWidget {
  final Isvisibel? isvisit;
  const SearchView({Key? key, required this.isvisit, Object? args})
      : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<HomeProvider>(context, listen: false).setSrachText();
        Provider.of<SearchModel>(context, listen: false).reset();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  widget.isvisit!.isvible
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
                                child: widget.isvisit!.isvible
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
