
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;
  int _height = 89;
  int get height => _height;
  
  final TextEditingController _searchtxt=TextEditingController();
  TextEditingController get searchtxt=> _searchtxt;
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollcontroller => _scrollController;
  HomeProvider() {
    _scrollController.addListener(() {
      if (_scrollController.offset > 5) {
        _isVisible = false;
        _height = 0;
        notifyListeners();
      } else {
        _height = 100;
        _isVisible = true;
        notifyListeners();
      }
    });
  }
}
