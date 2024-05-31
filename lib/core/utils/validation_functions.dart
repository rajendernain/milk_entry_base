import 'package:milk_entry/core/app_export.dart';

bool isValidPhone(String? inputString, {bool isRequired = false}){
  bool isInputStringValid = false;
  if(!isRequired && (inputString == null ? true : inputString.isEmpty)){
    isInputStringValid = true;
  }
  if(inputString != null && inputString.isNotEmpty){
    if(inputString.length > 16 || inputString.length < 6) return false;
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}


String? validatePhoneNumber(String? value) {
  final phoneRegExp = RegExp(r'^\+?1?\d{9,15}$');
  if (value == null || value.isEmpty) {
    return 'lbl_please_enter_phone'.tr;
  } else if (!phoneRegExp.hasMatch(value)) {
    return 'lbl_please_enter_valid_phone'.tr;
  }
  return null;
}

bool isValidPassword(String? inputString, {bool isRequired = false}){
  bool isInputStringValid = false;
  if(!isRequired && (inputString == null ? true : inputString.isEmpty)){
    isInputStringValid = true;
  }
  if(inputString != null && inputString.isNotEmpty){
    const pattern = r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isText(String? inputString, {bool isRequired = false}){
  bool isInputStringValid = false;
  if(!isRequired && (inputString == '' ? true : inputString!.isEmpty)){
    isInputStringValid = true;
  }
  if(inputString != null && inputString.isNotEmpty){
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}