import 'package:blood_bank/view/presentation/Splash_Screen/splash_view.dart';
import 'package:blood_bank/view/shared/component/constants.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  CacheHelper.init();
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
// 1-this to check if the server work or not the response should be like this 
// {
//     "servier": "true"
// }
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/'));


// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
// 2- I updated the remove blood request I made the user can do it and the donate too 
//3- the blood request is optional in the register
//4- the examin code 
// var request = http.MultipartRequest('PUT', Uri.parse('http://127.0.0.1:8000/blood/4/donate-approved/'));
// request.fields.addAll({
//   'blood_group': 'A+'
// });


// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
//5- function to get all the accepted request 
// var headers = {
//   'Authorization': 'Token 08fda60e13a1e8adff11b07089d40db8fa7e03ec'
// };
// var request = http.MultipartRequest('GET', Uri.parse('http://127.0.0.1:8000/blood/all/accepted-requests/'));
// request.fields.addAll({
//   'blood_group': 'A+'
// });

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
