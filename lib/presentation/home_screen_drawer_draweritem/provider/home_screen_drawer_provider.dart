import 'package:flutter/material.dart';

import '../models/home_screen_drawer_mode.dart';

class HomeScreenDrawerProvider extends ChangeNotifier {
  HomeScreenDrawerModel registerModel = HomeScreenDrawerModel();

  @override
  void dispose(){
    super.dispose();
  }
}