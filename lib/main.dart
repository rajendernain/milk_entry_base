import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_localization/flutter_localization.dart';
import 'package:milk_entry/core/app_export.dart';
import 'package:milk_entry/presentation/auth/provider/auth_provider.dart';
import 'package:milk_entry/presentation/home_screen_page/provider/home_screen_provider.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context)=>ThemeProvider(),
            ),
            ChangeNotifierProvider<AuthProvider>(
              create: (context)=>AuthProvider(),
            ),
            ChangeNotifierProvider<HomeScreenProvider>(
              create: (context)=>HomeScreenProvider(),
            )
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child){
              return MaterialApp(
                title: 'milk_entry',
                debugShowCheckedModeBanner: false,
                theme: theme,
                navigatorKey: NavigatorService.navigatorKey,
                localizationsDelegates: const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en','')],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.route,
              );
            },
          ),
        );
      },
    );
  }
}
