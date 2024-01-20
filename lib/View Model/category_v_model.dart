import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/api_responses.dart';
import 'package:wallpapers_app_flutter/Model/models.dart';
import 'package:wallpapers_app_flutter/Repository/image_repository.dart';

class CategoryViewModel with ChangeNotifier {
  String? _category;
  String? get category => _category;

  setcategoryName(String name) {
    _category = name;
    notifyListeners();
  }

  final _repo = ImagesRepository();
  ApiResponse<ImagesModel> _imagesdata = ApiResponse.Loading();
  ApiResponse<ImagesModel> get imagesdata => _imagesdata;

  void setApiresponse(ApiResponse<ImagesModel> imagesdata) {
    _imagesdata = imagesdata;
    notifyListeners();
  }

  Future<void> fetchImagesList(BuildContext context) async {
    setApiresponse(ApiResponse.Loading());
    try {
       await _repo.fetchCategories(context).then((value) {
        print(value.photos![10].src!.large2x);
        setApiresponse(ApiResponse.Completed(value));
      });
    } catch (error) {
      setApiresponse(ApiResponse.Error(error.toString()));
    }
    notifyListeners();
  }
}
