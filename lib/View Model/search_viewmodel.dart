import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Response/api_responses.dart';
import 'package:wallpapers_app_flutter/Model/models.dart';
import 'package:wallpapers_app_flutter/Repository/image_repository.dart';

class SearchModel with ChangeNotifier {
  bool _hit = false;
  bool get hit => _hit;
  final _repo = ImagesRepository();

  ApiResponse<ImagesModel> _getsearchresult = ApiResponse.Loading();
  ApiResponse<ImagesModel> get getsearchresult => _getsearchresult;

  void _setSearchresponse(ApiResponse<ImagesModel> imagesModel) {
    _getsearchresult = imagesModel;
    notifyListeners();
  }

  void setHit() {
    _hit = false;
    notifyListeners();
  }

  Future<void> fetchSearchresult(BuildContext context) async {
    _setSearchresponse(ApiResponse.Loading());
    _hit = true;
    try {
      _repo.fetchsearchImages(BuildContext, context).then((value) {
        _setSearchresponse(ApiResponse.Completed(value));
      }).onError((error, stackTrace) {
        _setSearchresponse(ApiResponse.Error(error.toString()));
      });
    } catch (e) {
      _setSearchresponse(ApiResponse.Error(e.toString()));
    }
  }

  void reset() {
    _hit = false;
    _getsearchresult = ApiResponse.Loading();
  }
 
}
