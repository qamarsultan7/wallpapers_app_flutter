
import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Network/base_api.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Network/network_api.dart';
import 'package:wallpapers_app_flutter/Model/models.dart';
import 'package:wallpapers_app_flutter/Resources/constants.dart';

class ImagesRepository {
  final BaseApiServices _apiServices = NetwokApiResponse();

  Future<ImagesModel> fectchImages() async {
    try {
      dynamic response = await _apiServices.getImagesAPI(AppUrls.homePage, AppUrls.apikey);
      return response = ImagesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ImagesModel> fetchsearchImages(BuildContext,context) async {
    try {
      dynamic response = await _apiServices.getImagesAPI(AppUrls.buildSearchApi(context), AppUrls.apikey);
      return response = ImagesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  Future<ImagesModel> fetchCategories(BuildContext context) async {
    try {
      dynamic response = await _apiServices.getImagesAPI(AppUrls.buildCategoryApi(context), AppUrls.apikey);
      return response = ImagesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
