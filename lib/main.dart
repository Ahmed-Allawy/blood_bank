import 'package:blood_bank/view/presentation/Splash_Screen/splash_view.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
  CacheHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
