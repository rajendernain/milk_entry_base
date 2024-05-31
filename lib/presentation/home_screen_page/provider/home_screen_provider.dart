import 'package:flutter/material.dart';

import '../../../services/api_service.dart';
import '../models/home_screen_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  final apiService = ApiService();
  HomeScreenModel registerModel = HomeScreenModel();

  int _bottomIndex = 0;
  int get bottomIndex => _bottomIndex;
  void updateBottomIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }

}