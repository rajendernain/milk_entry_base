import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/utils/constants.dart';

class ApiService {

  Future<Map<String, dynamic>?> post(String endpoint, data) async {
    try{
      var headerData = {
        "device_id": '12345',
        //"access_token": access_token,
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
        "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      };
      final response = await http.post(Uri.parse(Constants.baseUrl + endpoint),
          headers: headerData, body: data);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return null;
    }catch(e){
      return {"servererror": "Server error"};
    }
  }

  Future userLogin(String phone, String password) async {
    try {
      dynamic data = jsonEncode(<dynamic, dynamic>{
        'identifier': phone,
        'password': password
      });
      final response = await post('/login', data);
      return response;
    } catch (e) {
      print("Error(Function login):$e");
      return e.toString();
    }
  }

}
