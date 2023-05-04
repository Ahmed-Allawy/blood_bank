// ignore_for_file: unused_element, non_constant_identifier_names, avoid_print

import 'package:blood_bank/view/shared/component/constants.dart';

import 'package:flutter/material.dart';

import 'device_size.dart';

// ignore: must_be_immutable
class GeneralcustomButton extends StatelessWidget {
  const GeneralcustomButton({super.key, this.text, this.onTap, this.selected});
  final String? text;
  final bool? selected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 60,
          width: LayoutSize.screenWidth,
          decoration: BoxDecoration(
            color: selected ?? false ? secondaryColor : anotherColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                fontSize: 20,
                color: selected ?? false ? anotherColor : secondaryColor,
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
    LayoutSize().init(context);
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
          SizedBox(width: 0.18 * LayoutSize.layoutValue!),
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

class GeeneralLable extends StatelessWidget {
  const GeeneralLable({super.key, this.image, this.text});
  final IconData? image;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          image!,
          color: secondaryColor,
        ),
        Text(
          text!,
          style: const TextStyle(
            fontSize: 18,
            color: secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class GeneralOptionButtons extends StatelessWidget {
  GeneralOptionButtons(
      {super.key,
      this.leftButtonCaption,
      this.rightButtonCation,
      this.leftButtonOntap,
      this.rightButtonOntap,
      this.selected});
  final String? leftButtonCaption;
  final String? rightButtonCation;
  final VoidCallback? leftButtonOntap;
  final VoidCallback? rightButtonOntap;
  bool? selected;
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 130,
          height: 40,
          child: GeneralcustomButton(
            text: leftButtonCaption,
            onTap: leftButtonOntap,
            selected: selected,
          ),
        ),
        SizedBox(
          width: 0.14 * LayoutSize.layoutValue!,
        ),
        SizedBox(
          width: 130,
          height: 40,
          child: GeneralcustomButton(
            text: rightButtonCation,
            onTap: rightButtonOntap,
            selected: !selected!,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class GeneralPage1 extends StatefulWidget {
  const GeneralPage1({
    Key? key,
    required this.pageTitle,
    required this.doneOntap,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.buttonCaption,
    required this.backOntap,
    required this.locationImage,
    required this.phoneImage,
    required this.emailImage,
    required this.leftButtonCaption,
    required this.rightButtonCation,
  }) : super(key: key);

  final String? pageTitle;
  final String? location;
  final IconData? locationImage;
  final String? phoneNumber;
  final IconData? phoneImage;
  final String? email;
  final IconData? emailImage;
  final String? buttonCaption;
  final VoidCallback? doneOntap;
  final VoidCallback? backOntap;
  final String? leftButtonCaption;
  final String? rightButtonCation;
  @override
  State<GeneralPage1> createState() => _GeneralPage1State();
}

class _GeneralPage1State extends State<GeneralPage1> {
  bool _pageNumber = true;

  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        toolbarHeight: 0.16 * LayoutSize.layoutValue!,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: anotherColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(33),
              bottomRight: Radius.circular(33),
            ),
          ),
        ),
        leading: BackButton(
          color: secondaryColor,
          onPressed: widget.backOntap,
        ),
        centerTitle: true,
        title: Text(
          widget.pageTitle!,
          style: const TextStyle(
            fontSize: 36,
            color: secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          GeneralOptionButtons(
            selected: _pageNumber,
            rightButtonOntap: () {
              setState(() {
                _pageNumber = false;
                print('pageNumber is false');
              });
            },
            leftButtonCaption: widget.leftButtonCaption,
            rightButtonCation: widget.rightButtonCation,
            leftButtonOntap: () {
              setState(() {
                _pageNumber = true;
                print('pageNumber is true');
              });
            },
          ),
          if (_pageNumber)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.1 * LayoutSize.layoutValue!,
                    vertical: 0.2 * LayoutSize.layoutValue!,
                  ),
                  child: GeneralUserInfo(
                    location: widget.location!,
                    locationImage: widget.locationImage!,
                    phoneNumber: widget.phoneNumber!,
                    email: widget.email!,
                    phoneInmage: widget.phoneImage,
                    emailImage: widget.emailImage,
                    buttonCaption: widget.buttonCaption,
                    ontap: widget.doneOntap,
                  ),
                ),
              ),
            )
          else
            const Text("data"),
        ],
      ),
    );
  }
}

class GeneralUserInfo extends StatelessWidget {
  const GeneralUserInfo(
      {super.key,
      this.location,
      this.phoneNumber,
      this.email,
      this.buttonCaption,
      this.ontap,
      this.phoneInmage,
      this.emailImage,
      this.locationImage});
  final String? location;
  final IconData? locationImage;
  final String? phoneNumber;
  final IconData? phoneInmage;
  final String? email;
  final IconData? emailImage;
  final String? buttonCaption;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: popColor, borderRadius: BorderRadius.all(Radius.circular(51))),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/O.png',
            width: 88,
            height: 119,
          ),
          const Text(
            'Ahmed allawy',
            style: TextStyle(
              fontSize: 20,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 0.04 * LayoutSize.layoutValue!,
          ),
          GeeneralLable(
            text: location!,
            image: locationImage!,
          ),
          SizedBox(
            height: 0.04 * LayoutSize.layoutValue!,
          ),
          GeeneralLable(
            text: phoneNumber!,
            image: phoneInmage!,
          ),
          SizedBox(
            height: 0.04 * LayoutSize.layoutValue!,
          ),
          GeeneralLable(
            text: email!,
            image: emailImage!,
          ),
          SizedBox(
            height: 0.06 * LayoutSize.layoutValue!,
          ),
          SizedBox(
            width: 130,
            height: 40,
            child: GeneralcustomButton(
              text: buttonCaption,
              onTap: ontap,
              selected: true,
            ),
          ),
          SizedBox(
            height: 0.06 * LayoutSize.layoutValue!,
          ),
        ],
      ),
    );
  }
}
