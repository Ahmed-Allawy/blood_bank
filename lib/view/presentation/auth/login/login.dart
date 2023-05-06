import 'package:blood_bank/view/presentation/auth/register/register.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../shared/component/helperfunctions.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 153, height: 129, child: Image.asset('assets/logo.png')),
            SizedBox(
              height: LayoutSize.layoutValue! * 0.03,
            ),
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 26, color: secondaryColor),
            ),
            SizedBox(
              height: LayoutSize.layoutValue! * 0.1,
            ),
            Text.rich(TextSpan(
                text: "Forget Password",
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    color: anotherColor),
                recognizer: TapGestureRecognizer()..onTap = () {})),
            SizedBox(
              height: 0.1 * LayoutSize.layoutValue!,
            ),
            SizedBox(
              width: 210,
              height: 50,
              child: GeneralcustomButton(
                text: "Next",
                onTap: () {},
                selected: true,
              ),
            ),
            SizedBox(
              height: 0.16 * LayoutSize.layoutValue!,
            ),
            Text.rich(TextSpan(
                text: "you don't have an account? ",
                style: const TextStyle(fontSize: 18, color: anotherColor),
                children: <TextSpan>[
                  TextSpan(
                      text: "  Sign Up",
                      style: const TextStyle(
                          color: secondaryColor,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          nextScreen(context, const Register());
                        })
                ]))
          ],
        ),
      ),
    );
  }
}
