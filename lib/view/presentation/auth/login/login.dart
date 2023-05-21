import 'package:blood_bank/model/get_user_info.dart';
import 'package:blood_bank/view/presentation/auth/register/register.dart';
import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/component/device_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../shared/component/helperfunctions.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../shared/network/local/cach_helper.dart';
import '../../blood_bank/blood_bank_view.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  int phoneNumber = 0;
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool reqstatus = false;
  late final GetUserInfo userdata;
  bool isUserAdmin = false;

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
                    width: 153,
                    height: 129,
                    child: Image.asset('assets/logo.png')),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
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
                      onChanged: (value) =>
                          phoneNumber = int.parse(value.completeNumber),
                      initialCountryCode: 'EG',
                    ),
                  ),
                ),
                TextInputField(
                  textController: passwordController,
                  hintText: 'enter Password',
                  icon: const Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Invalied Input';
                    }
                    return null;
                  },
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
                    text: "LogIn",
                    selected: true,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        login(phoneNumber, passwordController.text)
                            .then((value) {
                          if (value) {
                            getUserInfo().then((value) {
                              setState(() {
                                userdata = value;
                                CacheHelper.saveData(
                                    key: 'userEmail', value: userdata.email);
                                CacheHelper.saveData(
                                    key: 'userPhoneNumber',
                                    value: userdata.phoneNum);
                                CacheHelper.saveData(
                                    key: 'userName', value: userdata.name);
                                CacheHelper.saveData(
                                    key: 'userLocation',
                                    value: userdata.location);
                                CacheHelper.saveData(
                                    key: 'userBloodType',
                                    value: userdata.bloodGroup);
                              });
                            });
                            isAdmin().then((value) {
                              value
                                  ? Get.to(() => const BloodBankView(),
                                      transition: Transition.rightToLeft,
                                      duration:
                                          const Duration(milliseconds: 500))
                                  : Get.to(() => const Home(),
                                      transition: Transition.rightToLeft,
                                      duration:
                                          const Duration(milliseconds: 500));
                            });
                          } else {
                            setState(() {
                              reqstatus = true;
                              passwordController.clear();
                            });
                          }
                        });
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: reqstatus,
                  child: const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Invalid phone number and password\ntry signup instead',
                        style: TextStyle(color: anotherColor),
                        textAlign: TextAlign.center,
                      )),
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
        ),
      ),
    );
  }
}

Future<bool> login(phone, pass) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/login/'));
  //here I send the password and the phone number for login by passing them to the body
  request.body = json.encode({"password": pass, "phone_num": phone});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  //here is the response
  if (response.statusCode == 200) {
    String body = await response.stream.bytesToString();
    var responseJason = jsonDecode(body);

    if (responseJason['message'] != 'Invalid phone number and password') {
      //here I save the token to var you can save it to sharedprefrence
      var token = responseJason['token'];

      CacheHelper.saveData(key: 'token', value: token);

      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future<GetUserInfo> getUserInfo() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request =
      http.Request('GET', Uri.parse('http://127.0.0.1:8000/getuser/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 202) {
    var body = await response.stream.bytesToString();
    Map<String, dynamic> jsonList = jsonDecode(body);
    GetUserInfo userData = GetUserInfo.fromJson(jsonList);

    return userData;
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<bool> isAdmin() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request =
      http.Request('GET', Uri.parse('http://127.0.0.1:8000/isadmin/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();

    return body == '[true]'; // Convert response to boolean value
  } else {
    return false; // Return false if request failed
  }
}
