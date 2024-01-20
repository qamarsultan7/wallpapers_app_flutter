// ignore_for_file: implementation_imports

import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app_flutter/Providers/home_provider.dart';
import 'package:wallpapers_app_flutter/View%20Model/category_v_model.dart';

class AppUrls {
  static String baseUrl = 'https://api.pexels.com/v1/';
  static String homePage = '${baseUrl}curated?page=1&per_page=100';

  static String buildSearchApi(BuildContext context) {
    final searchProvider = Provider.of<HomeProvider>(context, listen: false);
    String query = searchProvider.searchtxt.text;
    return '${baseUrl}search?query=$query&per_page=100';
  }

  static String buildCategoryApi(BuildContext context) {
    final searchProvider = Provider.of<CategoryViewModel>(context, listen: false);
    String? query = searchProvider.category;
    return '${baseUrl}search?query=$query&per_page=100';
  }
  static String apikey =
      'F9HcvnXykXrtJ4vkSop3XnXPVgTQ2wLZkOG8jYXuJF4uLzJYVBzz66kH';
}

// ImgeViewScreen Arguments
class ImageViewArguments {
  final String imageUrl;

  ImageViewArguments({required this.imageUrl});
}

//Categories Argument
class Isvisibel {
  final bool isvible;

  Isvisibel({required this.isvible});
}

//Home Categories
class Categories {
  final String name;
  final String image;
  Categories({required this.image, required this.name});
}

List<Categories> categoriesList = [
  Categories(
      image:
          'https://images.pexels.com/photos/15483667/pexels-photo-15483667/free-photo-of-flag-of-palestine.jpeg?auto=compress&cs=tinysrgb&w=600',
      name: 'Palestine'),
  Categories(
      image:
          'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Nature'),
  Categories(
      image:
          'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      name: 'Cars'),
  Categories(
      image:
          'https://images.pexels.com/photos/276452/pexels-photo-276452.jpeg?auto=compress&cs=tinysrgb&w=600',
      name: 'Programming'),
  Categories(
      image:
          'https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&w=600',
      name: 'Buildings')
];
