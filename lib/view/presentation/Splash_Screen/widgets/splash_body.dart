// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print

import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../on Boarding/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);
    goToNextScreen();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png'),
          const SizedBox(
            height: 20,
          ),
          FadeTransition(
            opacity: fadingAnimation!,
            child: const Text(
              'WELCOME',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 51,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const OnBoardingView(), transition: Transition.fade);
    });
  }
}
