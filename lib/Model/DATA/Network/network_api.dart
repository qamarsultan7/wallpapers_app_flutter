import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpapers_app_flutter/Model/DATA/Exceptions/exceptions.dart';
import 'package:wallpapers_app_flutter/Model/DATA/Network/base_api.dart';
import 'package:wallpapers_app_flutter/Utilities/utils.dart';

class NetwokApiResponse extends BaseApiServices {
  @override
  Future<void> getImagesAPI(appUrl, apiKey) async {
    dynamic jasonresponse;
    try {
      final response = await http.get(Uri.parse(appUrl), headers: {
        'Authorization': apiKey
      }).timeout(const Duration(seconds: 10));
      jasonresponse = seturnresponse(response);
      return jasonresponse;
    } on SocketException {
      Utils.ShowFlutterToast(
          'Something Went Wrong \n Please Check Your internet Connection',
          const Color.fromARGB(255, 192, 16, 4));
    } on TimeoutException catch (t) {
      Utils.ShowFlutterToast(
          'TimeOut $t \n Please Check Your internet Connection',
          const Color.fromARGB(255, 192, 16, 4));
    }
    throw UnimplementedError();
  }
}
dynamic seturnresponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 400:
      return BadRequest(response.statusCode.toString());
    case 404:
      throw Unauthorizedrequest(response.statusCode.toString());
    default:
      throw FetchDataExption(
          'Error While Connection To the Server${response.statusCode}');
  }
}
