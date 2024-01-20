import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/api_responses.dart';
import 'package:wallpapers_app_flutter/Model/models.dart';
import 'package:wallpapers_app_flutter/Repository/image_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _repo = ImagesRepository();
  ApiResponse<ImagesModel> _imagesdata = ApiResponse.Loading();
  ApiResponse<ImagesModel> get imagesdata => _imagesdata;

  void setApiresponse(ApiResponse<ImagesModel> imagesdata) {
    _imagesdata = imagesdata;
    notifyListeners();
  }

  Future<void> fetchImagesList() async {
    setApiresponse(ApiResponse.Loading());

    try {
      final value = await _repo.fectchImages();

      setApiresponse(ApiResponse.Completed(value));
    } catch (error) {
      setApiresponse(ApiResponse.Error(error.toString()));
    }

    notifyListeners();
  }
}
