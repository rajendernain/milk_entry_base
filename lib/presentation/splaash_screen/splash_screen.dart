import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../auth/provider/auth_provider.dart';
import 'models/splash_model.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: SplashScreen(),
    );
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.tryAutoLogin();
    if (authProvider.isAuthenticated) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginRegisterScreen);
    }
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
                      height: 140.v,
                      width: 105.h,
                      margin: EdgeInsets.only(bottom: 18.v),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse7,
                      height: 154.v,
                      width: 184.h,
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
                                style: theme.textTheme.displayMedium,
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 36.v,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgLogo,
                        height: 320.v,
                        width: 250.h,
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
                      height: 114.v,
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
