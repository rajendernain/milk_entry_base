import 'package:flutter/material.dart';
import '../models/login_screen_model.dart';
import '../models/register_screen_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/api_service.dart';


class AuthProvider with ChangeNotifier {
  final apiService = ApiService();
  //Login screen model and controller
  LoginScreenModel loginScreenModel = LoginScreenModel();
  //Login screen controllers
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;

  //Register screen model and controller
  RegisterModel registerModel = RegisterModel();
  //Registration screen controllers
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _fatherTextController = TextEditingController();
  TextEditingController _dairyNameTextController = TextEditingController();
  TextEditingController _centerNameTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get fatherTextController => _fatherTextController;
  TextEditingController get dairyNameTextController => _dairyNameTextController;
  TextEditingController get centerNameTextController => _centerNameTextController;
  TextEditingController get addressTextController => _addressTextController;

  //User? _user;
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  //User? get user => _user;

  AuthProvider(){
    _isAuthenticated = true;
  //   login('infosoft@gmail.com', '123456');
  }
  @override
  void dispose(){
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _nameTextController.dispose();
    _fatherTextController.dispose();
    _dairyNameTextController.dispose();
    _centerNameTextController.dispose();
  }

  Future login(String email, String password) async {
    print('???????????????????????????==1111111111111111===============');

    final response = await apiService.userLogin(email, password);
    print('???????????????????????????=================');
    print(response.data);

    if (response != null) {
      //_user = User.fromJson(response);
      _isAuthenticated = true;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', json.encode(response));
      notifyListeners();
      return response; // Return the user data upon successful login
    }
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('user')) return;
    final extractedUserData = json.decode(prefs.getString('user')!) as Map<String, dynamic>;
    //_user = User.fromJson(extractedUserData);
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() async {
    _isAuthenticated = false;
    //_user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    notifyListeners();
  }
}
