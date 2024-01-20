import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/status.dart';
import 'package:wallpapers_app_flutter/Resources/Widget/masonary_Grid.dart';
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
        backgroundColor:  const Color.fromARGB(255, 3, 177, 108),
        onRefresh: (){
          return  Future.delayed(const Duration(seconds: 1), () {
            Provider.of<CategoryViewModel>(context, listen: false)
                .fetchImagesList(context);
          });
        },
        child: SingleChildScrollView(
          child: Consumer<CategoryViewModel>(builder: (_, categoryViemModel, __) {
            switch (categoryViemModel.imagesdata.status) {
              case Status.COMPLETE:
                return MasonaryGrid(
                  homeViewModel: categoryViemModel.imagesdata,
                );
              case Status.ERROR:
                return const Text('Error');
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              default:
                return const Center(child: Text('Search Soething'));
            }
          }),
        ),
      ),
    );
  }
}
