import 'package:blood_bank/view/presentation/Splash_Screen/widgets/splash_body.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: SplashViewBody(),
    );
  }
}
