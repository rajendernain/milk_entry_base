import 'package:flutter/material.dart';
import 'package:milk_entry/presentation/splaash_screen/models/splash_model.dart';

class SplashProvider extends ChangeNotifier {
  SplashModel splashModelObj = SplashModel();

  @override
  void dispose(){
    super.dispose();
  }
}