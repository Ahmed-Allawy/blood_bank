// ignore_for_file: unnecessary_const

import 'package:blood_bank/view/presentation/auth/login/login.dart';
import 'package:blood_bank/view/presentation/blood_bank/blood_bank_view.dart';
import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../shared/component/components.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});
  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  double _screenWidth = 0;
  double _screenHeight = 0;
  bool isUserAdmin = false;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {});
    // });
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    isAdmin().then((value) => isUserAdmin = value);
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    LayoutSize().init(context);
    return Container(
      color: primaryColor,
      child: Stack(
        children: [
          CustomPageView(
            pageController: pageController,
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: _screenHeight * 0.3375,
              child: DotsIndicator(
                dotsCount: 3,
                position:
                    pageController!.hasClients ? pageController!.page! : 0,
                decorator: const DotsDecorator(
                    color: Colors.white,
                    activeColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        side: BorderSide(color: Colors.red))),
              )),
          Positioned(
            top: _screenHeight * 0.05875,
            right: 32,
            child: Visibility(
              visible: pageController!.hasClients
                  ? (pageController!.page == 2 ? false : true)
                  : true,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print(CacheHelper.getData(key: 'token'));
                    if (CacheHelper.getData(key: 'token') == null) {
                      Get.to(() => const LogIn(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500));
                    } else {
                      !isUserAdmin
                          ? Get.to(() => const Home(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 500))
                          : Get.to(() => const BloodBankView(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 500));
                    }
                  });
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: anotherColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: _screenHeight * 0.165,
            left: _screenWidth * 0.25,
            right: _screenWidth * 0.25,
            child: GeneralcustomButton(
              selected: true,
              onTap: () {
                setState(() {
                  if (pageController!.page! < 2) {
                    pageController?.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    if (CacheHelper.getData(key: 'token') == null) {
                      Get.to(() => const LogIn(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500));
                    } else {
                      !isUserAdmin
                          ? Get.to(() => const Home(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 500))
                          : Get.to(() => const BloodBankView(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 500));
                    }
                  }
                });
              },
              text: pageController!.hasClients
                  ? pageController!.page == 2
                      ? 'Get Start'
                      : 'Next'
                  : 'Next',
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> isAdmin() async {
  var token = CacheHelper.getData(key: 'token');
  print(token);
  var headers = {'Authorization': 'Token $token'};
  var request =
      http.Request('GET', Uri.parse('http://127.0.0.1:8000/isadmin/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    print(body);
    return body == 'true'; // Convert response to boolean value
  } else {
    print(response.reasonPhrase);
    return false; // Return false if request failed
  }
}
