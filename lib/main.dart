import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:host/ui/screens/menu/menu_binding.dart';
import 'package:host/ui/screens/menu/menu_screen.dart';
import 'package:host/ui/screens/profile/profile_binding.dart';
import 'package:host/ui/screens/profile/profile_screen.dart';
import 'package:host/ui/screens/splash/splash_screen.dart';
import 'package:host/utils/AppFonts.dart';

import 'ui/screens/home/home_binding.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/splash/splash_binding.dart';
import 'utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: ThemeData(
          primarySwatch: Colors.blue, fontFamily: AppFonts.montserrat),
      initialRoute: '/',
      initialBinding: SplashBinding(),
      getPages: _list,
      debugShowCheckedModeBanner: false,
    );
  }

  final _list = [
    GetPage(
        name: '/', page: () => const SplashScreen(), binding: SplashBinding()),
    // name: '/', page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: profileRoute,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: viewMenuRoute,
        page: () => const MenuScreen(),
        binding: MenuBinding()),
    // GetPage(name: onBoardingRoute, page: () => OnBoardingScreen(), binding: OnBoardingBinding()),
    // GetPage(name: loginScreenRoute, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: homeScreenRoute,
        page: () =>  HomeScreen(),
        binding: HomeBinding()),
    // GetPage(name: myAccountRoute, page: () => const MyAccountScreen(), binding: MyAccountBinding()),
    // GetPage(name: editProfileRoute, page: () => EditProfileScreen(), binding: EditProfileBinding()),
  ];
}
