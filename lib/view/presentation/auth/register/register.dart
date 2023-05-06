import 'package:blood_bank/view/presentation/auth/login/login.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../shared/component/helperfunctions.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              height: LayoutSize.layoutValue! * 0.03,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 26, color: secondaryColor),
            ),
            SizedBox(
              height: 0.1 * LayoutSize.layoutValue!,
            ),
            SizedBox(
              width: 210,
              height: 50,
              child: GeneralcustomButton(
                text: "Confirm",
                onTap: () {},
                selected: true,
              ),
            ),
            SizedBox(
              height: 0.16 * LayoutSize.layoutValue!,
            ),
            Text.rich(TextSpan(
                text: "Already have an account?",
                style: const TextStyle(fontSize: 18, color: anotherColor),
                children: <TextSpan>[
                  TextSpan(
                      text: "  Sign In",
                      style: const TextStyle(
                          color: secondaryColor,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          nextScreen(context, const LogIn());
                        })
                ]))
          ],
        ),
      ),
    );
  }
}
