import 'package:flutter/material.dart';
import 'package:milk_entry/presentation/auth/provider/auth_provider.dart';
import 'package:milk_entry/theme/custom_button.dart';
import 'package:milk_entry/widgets/custom_elevated_button.dart';
import 'package:milk_entry/widgets/custom_text_form_field.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_text_style.dart';
import '../../core/app_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const LoginScreen(),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var authProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse8,
                height: 140.v,
                width: 105.h,
               // margin: EdgeInsets.only(bottom: 18.v),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse7,
                height: 154.v,
                width: 184.h,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: CustomImageView(
                fit: BoxFit.fitHeight,
                imagePath: ImageConstant.imgEllipse5,
                height: 155.v,
                width: 114.h,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse6,
                height: 114.v,
                width: 115.h,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "lbl_login".tr,
                              style: CustomTextStyles.displayMediumPrimary,
                            ),
                          ),
                          SizedBox(
                            height: 1.v,
                          ),
                          SizedBox(
                            width: 178.h,
                            child: Text(
                              "msg_welcome_back_you_ve_been".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.titleMediumCyan300,
                            ),
                          ),
                          SizedBox(
                            height: 47.v,
                          ),
                          _buildPhone(context),
                          SizedBox(
                            height: 29.v,
                          ),
                          _buildPassword(context),
                          SizedBox(
                            height: 20.v,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 46.v),
                              child: Text(
                                "msg_forgot_your_password".tr,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.v,
                          ),
                          _buildSignInButton(context),
                          SizedBox(
                            height: 20.v,
                          ),
                          InkWell(
                            onTap: (){
                              NavigatorService.popAndPushNamed(AppRoutes.registerScreen);
                            },
                            child: Text('msg_create_new_account'.tr,
                              style: theme.textTheme.titleMedium,),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhone(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 38.h, right: 42.h),
        child: Selector<AuthProvider, TextEditingController?>(
          selector: (context, provider) => provider.phoneController,
          builder: (context, phoneController, child) {
            return CustomTextFormField(
              controller: authProvider.phoneController,
              hintText: "lbl_phone_no".tr,
              textInputType: TextInputType.number,
              validator: validatePhoneNumber,
            );
          },
        ));
  }
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 38.h, right: 42.h),
      child: Selector<AuthProvider, TextEditingController?>(
        selector: (context, provider) => provider.passwordController,
        builder: (context, passwordController, child) {
          return CustomTextFormField(
            controller: authProvider.passwordController,
            hintText: "lbl_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true,
          );
        },
      ),
    );
  }
  Widget _buildSignInButton(BuildContext context) {
    return CustomElevatedButton(
      height: 41.v,
      text: "lbl_sign_in".tr,
      margin: EdgeInsets.only(left: 38.h, right: 42.h),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final phone = authProvider.phoneController.text;
          final password = authProvider.passwordController.text;

          // Print the values to console or handle them as needed
          print('Name---------------: $phone');
          print('Father name---------: $password');


          // var response = authProvider.login('infosoft@gmail.com', '123456');
          //  print('??????????????????????????????????????');
          //  print(response);
          // if (response != null && response.status == 'SUCCESS') {
          //
          // }
          // print(response.status);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Date featch success')),
          );
        }
      },
    );
  }
}
