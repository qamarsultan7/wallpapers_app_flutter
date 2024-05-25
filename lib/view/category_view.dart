import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/status.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/masonary_Grid.dart';
import 'package:wallpapers_app_flutter/Resources/components/grid_view.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/View%20Model/category_v_model.dart';

class CategoryView extends StatelessWidget {
  final ImageViewArguments? title;
  const CategoryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(title!.imageUrl),
      ),
      body: RefreshIndicator.adaptive(
        backgroundColor: const Color.fromARGB(255, 3, 177, 108),
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1), () {
            Provider.of<CategoryViewModel>(context, listen: false)
                .fetchImagesList(context);
          });
        },
        child: SingleChildScrollView(
          child:
              Consumer<CategoryViewModel>(builder: (_, categoryViemModel, __) {
            switch (categoryViemModel.imagesdata.status) {
              case Status.COMPLETE:
                return MasonaryGrid(
                  homeViewModel: categoryViemModel.imagesdata,
                );
              case Status.ERROR:
                return Column(
                  children: [
                    const Text('Error'),
                    TextButton(onPressed: () {}, child: const Text('Refresh'))
                  ],
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
                return const Center(child: Text('Search Soething'));
            }
          }),
        ),
      ),
    );
  }
}
