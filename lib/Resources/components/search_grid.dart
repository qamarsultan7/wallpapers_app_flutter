// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/status.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/masonary_Grid.dart';
import 'package:wallpapers_app_flutter/View%20Model/search_viewmodel.dart';

class SearchGrid extends StatelessWidget {
   const SearchGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(
      builder: (_, seacrchmodel, __) {
        switch (seacrchmodel.getsearchresult.status) {
          case Status.COMPLETE:
            return MasonaryGrid(
              homeViewModel: seacrchmodel.getsearchresult,
            );
          case Status.ERROR:
            return const Text('Error');
          case Status.LOADING:
            return const CircularProgressIndicator();
          default:
            return const Center(child: Text('Search Soething'));
        }
      },
    );
  }
}
