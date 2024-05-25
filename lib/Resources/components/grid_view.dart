// ignore_for_file: must_be_immutable

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/status.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/buttons.dart';
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
            return Center(
              child: buttons(context, 'Refresh', const Icon(Icons.refresh), () {
                Future.delayed(const Duration(seconds: 1), () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .fetchImagesList();
                });
              }),
            );
          case Status.LOADING:
            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: const Color.fromARGB(255, 255, 234, 234),
              child: const MasonaryGridShimmer(
                counts: 2,
              ),
            );

          default:
            return Text(homeviewModel.imagesdata.message.toString());
        }
      },
    );
  }
}

class MasonaryGridShimmer extends StatelessWidget {
  final int counts;
  final int items;
  final int padding;
  const MasonaryGridShimmer({
    Key? key,
    required this.counts,
    this.items = 20,
    this.padding = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: counts),
      itemCount: items,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(padding.toDouble()),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.blue,
              height: 200,
            ),
          ),
        );
      },
    );
  }
}
