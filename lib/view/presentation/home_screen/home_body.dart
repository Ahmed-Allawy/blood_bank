import 'package:blood_bank/view/presentation/home_screen/widgets/info_card.dart';
import 'package:blood_bank/view/presentation/home_screen/widgets/side_menu.dart';
import 'package:blood_bank/view/shared/component/constants.dart';

import 'package:flutter/material.dart';

import '../../shared/component/device_size.dart';
import 'widgets/main_functions_buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Scaffold(
      drawer: const NaveBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const InfoCards(),
              SizedBox(
                height: 0.22 * LayoutSize.layoutValue!,
              ),
              const MainFunctionsButtons(),
            ]),
      ),
    );
  }
}
