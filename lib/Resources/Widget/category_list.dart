import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';
import 'package:wallpapers_app_flutter/Utilities/Routes/route_name.dart';
import 'package:wallpapers_app_flutter/View%20Model/category_v_model.dart';

class CategoryList extends StatelessWidget {
  final String imgUrl;
  final String title;
  const CategoryList({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryViewModel>(context);
    return GestureDetector(
      onTap: () {
        final args = ImageViewArguments(imageUrl: title.toString());
        categoryProvider.setcategoryName(title);
        categoryProvider.fetchImagesList(context);
        Navigator.pushNamed(context, RoutNames.CATEGORY_VIEW, arguments: args);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(5),
        width: MediaQuery.sizeOf(context).width / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imgUrl.toString())),
        ),
        child: Center(
            child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 35),
          ),
        )),
      ),
    );
  }
}
