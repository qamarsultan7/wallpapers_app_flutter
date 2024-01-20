


import 'package:wallpapers_app_flutter/Model/DATA/Response/status.dart';

class ApiResponse<T> {
  Status? status ;
  T? data;
  String? message;
  ApiResponse(this.status,this.message,this.data);

  ApiResponse.Loading(): status=Status.LOADING;
  ApiResponse.Completed(this.data):status=Status.COMPLETE;
  ApiResponse.Error(this.message):status=Status.ERROR;

   @override
  String toString() {
    
    return 'status :$status \n Message: $message \n Data:$data';
  }
}