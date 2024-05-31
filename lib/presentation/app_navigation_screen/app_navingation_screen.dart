import 'package:flutter/material.dart';
import 'package:milk_entry/core/app_export.dart';
import 'package:milk_entry/presentation/app_navigation_screen/provider/app_navigation_screen.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key});

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
  static Widget builder(BuildContext context){
    return ChangeNotifierProvider(
        create: (context) => AppNavigationProvider(),
        child: AppNavigationScreen(),
    );
  }
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('AppNavigationScreen');
  }
}
