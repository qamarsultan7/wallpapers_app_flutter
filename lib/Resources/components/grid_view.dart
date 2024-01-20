// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/status.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/masonary_Grid.dart';
import 'package:wallpapers_app_flutter/View%20Model/home_model.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, homeviewModel, __) {
        switch (homeviewModel.imagesdata.status) {
          case Status.COMPLETE:
            return MasonaryGrid(
              homeViewModel: homeviewModel.imagesdata,
            );
          case Status.ERROR:
            return const Text('Error');
          case Status.LOADING:
            return const CircularProgressIndicator();

          default:
            return Text(homeviewModel.imagesdata.message.toString());
        }
      },
    );
  }
}
