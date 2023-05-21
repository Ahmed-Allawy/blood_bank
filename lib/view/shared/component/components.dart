// ignore_for_file: unused_element, non_constant_identifier_names, avoid_print, library_private_types_in_public_api

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

class GeneralUserInfo extends StatelessWidget {
  const GeneralUserInfo(
      {super.key,
      required this.location,
      required this.phoneNumber,
      required this.email,
      this.buttonCaption,
      this.ontap,
      this.imageBlood,
      required this.personName});
  final String? location;

  final String? phoneNumber;

  final String? email;

  final String? buttonCaption;
  final VoidCallback? ontap;
  final String? imageBlood;
  final String? personName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: popColor, borderRadius: BorderRadius.all(Radius.circular(51))),
      child: Column(
        children: <Widget>[
          if (imageBlood != null)
            Image.asset(
              imageBlood!,
              width: 88,
              height: 119,
            ),
          if (imageBlood == null)
            SizedBox(
              height: 0.04 * LayoutSize.layoutValue!,
            ),
          Text(
            personName!,
            style: const TextStyle(
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
            image: Icons.location_on,
          ),
          SizedBox(
            height: 0.04 * LayoutSize.layoutValue!,
          ),
          GeeneralLable(
            text: phoneNumber!,
            image: Icons.phone,
          ),
          SizedBox(
            height: 0.04 * LayoutSize.layoutValue!,
          ),
          GeeneralLable(
            text: email!,
            image: Icons.email,
          ),
          SizedBox(
            height: 0.06 * LayoutSize.layoutValue!,
          ),
          if (buttonCaption != null)
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

class BloodBankCards extends StatelessWidget {
  const BloodBankCards({
    super.key,
    required this.dateText,
    required this.personName,
    required this.time,
    required this.personLocation,
    required this.personImage,
    required this.onTapButton,
    required this.buttonCaption,
  });
  final String? dateText;
  final String? personName;
  final String? time;
  final String? personLocation;
  final String? personImage;
  final VoidCallback? onTapButton;
  final String? buttonCaption;
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Center(
      child: Stack(children: <Widget>[
        Container(
          height: LayoutSize.layoutValue! * 0.36,
          width: LayoutSize.layoutValue! * 0.9,
          decoration: const BoxDecoration(
              color: anotherColor,
              borderRadius: BorderRadius.all(Radius.circular(11))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextField(
                      text: "Date: $dateText",
                    ),
                    TextField(
                      text: personName,
                    ),
                  ],
                ),
                SizedBox(
                  height: LayoutSize.layoutValue! * 0.025,
                ),
                TextField(
                  text: "Time: $time",
                ),
                SizedBox(
                  height: LayoutSize.layoutValue! * 0.025,
                ),
                TextField(
                  text: "Location: $personLocation",
                ),
                SizedBox(
                  height: LayoutSize.layoutValue! * 0.02,
                ),
                SizedBox(
                  width: 110,
                  height: 37,
                  child: GeneralcustomButton(
                    text: buttonCaption,
                    onTap: onTapButton,
                    selected: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 220, top: 20),
          child: Image.asset(
            personImage!,
            width: 88,
            height: 119,
          ),
        ),
      ]),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        fontSize: 16,
        color: secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.textController,
    required this.obscureText,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.keyboardType,
  });

  final TextEditingController textController;
  final bool obscureText;
  final String hintText;
  final Icon icon;
  final Function validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 70, left: 70, top: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: anotherColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: textController,
          obscureText: obscureText,
          keyboardType: keyboardType ?? TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: icon,
              iconColor: secondaryColor,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: popColor,
              )),
          validator: (value) {
            return validator(value);
          },
        ),
      ),
    );
  }
}

class DateInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final Function validator;
  const DateInputField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.validator});

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  late DateTime? _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 70, left: 70, top: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: anotherColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () async {
            _dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: DateTime.now(),
              lastDate: DateTime.now(),
            );
            setState(() {
              widget.controller.text =
                  '${_dateTime!.year}-${_dateTime!.month}-${_dateTime!.day}';
            });
          },
          child: AbsorbPointer(
            child: TextFormField(
              validator: (value) => widget.validator(value),
              controller: widget.controller,
              decoration: InputDecoration(
                iconColor: secondaryColor,
                hintText: widget.labelText,
                hintStyle: const TextStyle(color: popColor),
                icon: const Icon(Icons.calendar_today),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
