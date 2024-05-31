import 'package:flutter/material.dart';
import 'package:milk_entry/presentation/login_register_screen/provider/login_register_provider.dart';
import 'package:milk_entry/theme/custom_button.dart';
import 'package:milk_entry/widgets/custom_elevated_button.dart';
import 'package:milk_entry/widgets/custom_outlined_button.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import '../../core/app_export.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginRegisterProvider(),
      child: LoginRegisterScreen(),
    );
  }
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 0,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse8,
                      height: 130.v,
                      width: 105.h,
                      //margin: EdgeInsets.only(bottom: 18.v),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse7,
                      height: 144.v,
                      width: 174.h,
                      //margin: EdgeInsets.only(bottom: 18.v),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_milk".tr,
                                style: CustomTextStyles.displayMediumPrimary,
                              ),
                              TextSpan(
                                  text: "lbl_entry".tr,
                                  style: theme.textTheme.displayMedium)
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      SizedBox(
                        width: 241.h,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "lbl_automatic".tr,
                                  style: CustomTextStyles.headlineLargePrimary,
                              ),
                              TextSpan(
                                  text: "msg_milk_collection".tr,
                                  style: theme.textTheme.headlineLarge),
                              TextSpan(
                                  text: "msg_unit".tr,
                                  style: CustomTextStyles.headlineLargePrimary),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 59.v,
                      ),
                      CustomElevatedButton(
                        width: 213.h,
                        text: "lbl_login".tr,
                        buttonStyle: CustomButtonStyle.fillPrimary,
                        buttonTextStyle: CustomTextStyles.headlineMediumLight,
                        onPressed: () {
                          NavigatorService.pushNamedAndRemoveUntil(
                            AppRoutes.loginScreen,
                          );
                        },
                      ),
                      SizedBox(
                        height: 8.v,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20.v,
                              bottom: 16.v,
                            ),
                            child: SizedBox(
                              width: 58.h,
                              child: Divider(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.h,
                            ),
                            child: Text(
                              "lbl_or".tr,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                top: 20.v,
                                bottom: 16.v,
                              ),
                              child: SizedBox(
                                width: 67.h,
                                child: Divider(
                                  indent: 7.h,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 12.v,
                      ),
                      CustomOutlinedButton(
                        width: 213.h,
                        text: "lbl_register".tr,
                        onPressed: () {
                          NavigatorService.pushNamedAndRemoveUntil(
                            AppRoutes.registerScreen,
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse5,
                      height: 200.v,
                      width: 144.h,
                      //margin: EdgeInsets.only(bottom: 18.v),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse6,
                      height: 150.v,
                      width: 115.h,
                      //margin: EdgeInsets.only(bottom: 18.v),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
