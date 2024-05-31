import 'package:flutter/material.dart';
import 'package:milk_entry/presentation/home_screen_page/provider/home_screen_provider.dart';
import '../../core/app_export.dart';
import '../../widgets/common_bottom_nav_bar.dart';
import '../auth/provider/auth_provider.dart';
import '../common/baseScaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static Widget builder(BuildContext context){
    return ChangeNotifierProvider(
      create: (context)=> HomeScreenProvider(),
      child: const HomeScreen(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var homeProvider;
  var count = 0;
  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeScreenProvider>(context, listen: true);
    return BaseScaffold(
      title: '',
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0,0.06),
            end: const Alignment(1,0.06),
            colors: [appTheme.cyan300,appTheme.blue200],
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Container(
            //padding: EdgeInsets.only(top: 290),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(70)
            ),
            child: InkWell(
              onTap: (){
                Provider.of<AuthProvider>(context, listen: false).logout();
                NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
              },
                child: Center(child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: Text('Logout',
                  style: theme.textTheme.headlineMedium,
                  ),
                ))
            ),
          ),
        ),
      ),
      bottomNavBar: CommonBottomNavBar(
        currentIndex: homeProvider.bottomIndex,
        onTap: (index) {
          homeProvider.updateBottomIndex(index);
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
          }
        },
      ),
    );
  }


}
