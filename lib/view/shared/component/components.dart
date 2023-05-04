import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:flutter/material.dart';

import 'device_size.dart';

class GeneralcustomButton extends StatelessWidget {
  const GeneralcustomButton({super.key, this.text, this.onTap});
  final String? text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 60,
          width: LayoutSize.screenWidth,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                fontSize: 20,
                color: anotherColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          )),
    );
  }
}

class BloodInfo extends StatelessWidget {
  const BloodInfo({super.key, this.text, this.image});
  final String? text;
  final String? image;
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        decoration: const BoxDecoration(
            color: anotherColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Benefits of blood donation',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  color: secondaryColor,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(children: <Widget>[
                  Text(
                    text!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: secondaryColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Image.asset(
                    image!,
                    width: 0.33 * LayoutSize.layoutValue!,
                    height: LayoutSize.layoutValue! * 0.15,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, this.image, this.onTap});
  final String text;
  final String? image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: anotherColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      image!,
                      width: 150,
                      height: 50,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 18,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ]),
            )));
  }
}

class UserOptions extends StatelessWidget {
  const UserOptions({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Row(children: <Widget>[
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 90),
          Image.asset('assets/arrow.png')
        ]),
      ),
    );
  }
}

class Linesapce extends StatelessWidget {
  const Linesapce({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffD9D9D9),
      height: 3,
    );
  }
}
