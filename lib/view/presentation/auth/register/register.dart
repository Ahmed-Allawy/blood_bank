// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:blood_bank/view/presentation/auth/login/login.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../home_screen/home_body.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? phoneNumber;
  String bloodGroupType = '';
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List bloodGroup = ['AB+', 'AB-', 'A', 'AA', 'B', 'BB', 'O', 'OO'];
  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            //this is the key
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: LayoutSize.layoutValue! * 0.03,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 26, color: secondaryColor),
                  ),
                ),
                TextInputField(
                  textController: nameController,
                  obscureText: false,
                  hintText: 'Full Name',
                  icon: const Icon(Icons.person),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalied Input';
                    }
                    return null;
                  },
                ),
                DateInputField(
                  controller: dateController,
                  labelText: 'Date Of Birth',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalied Input';
                    }
                    return null;
                  },
                ),
                TextInputField(
                  textController: locationController,
                  obscureText: false,
                  hintText: 'location EX: zagazig-sharkia-egypt',
                  icon: const Icon(Icons.location_on),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalied Input';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: anotherColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IntlPhoneField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (value) => phoneNumber = value.completeNumber,
                      initialCountryCode: 'EG',
                    ),
                  ),
                ),
                TextInputField(
                  textController: emailController,
                  obscureText: false,
                  hintText: 'Email',
                  icon: const Icon(Icons.email),
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                ),
                TextInputField(
                  textController: passwordController,
                  hintText: 'Enter Password',
                  icon: const Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalied Input';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: anotherColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: <Widget>[
                      const Icon(
                        Icons.bloodtype,
                        color: secondaryColor,
                      ),
                      DropdownButton(
                          iconEnabledColor: secondaryColor,
                          hint: Text(
                            bloodGroupType.isEmpty
                                ? 'Select Blood Group'
                                : 'your blood group is  $bloodGroupType',
                            style: TextStyle(
                                color: bloodGroupType.isEmpty
                                    ? popColor
                                    : Colors.black),
                          ),
                          items: bloodGroup.map((value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              bloodGroupType = value.toString();
                              print(bloodGroupType);
                            });
                          }),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 0.1 * LayoutSize.layoutValue!,
                ),
                SizedBox(
                  width: 210,
                  height: 50,
                  child: GeneralcustomButton(
                    text: "Confirm",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print(dateController.text);
                        nextScreen(context, const Home());
                      }
                    },
                    selected: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: Text.rich(TextSpan(
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
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
