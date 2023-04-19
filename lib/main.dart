import 'package:blood_bank/view/presentation/Splash_Screen/splash_view.dart';
import 'package:blood_bank/view/presentation/on%20Boarding/on_boarding_view.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
