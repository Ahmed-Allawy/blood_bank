// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

import 'widgets/donate_view_body.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
    return DonateViewBody(
      email: 'dgdssd@sdgd.com',
      location: 'cdscdsdsc',
      doneOntap: () {
        setState(() {
          print("object");
          // sendBloodRequest();
//           var headers = {
//   'Authorization': 'Token a5fd5ff9e485f4938c0bd3606c1d5060c7e63821'
// };
// var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/blood/request-self/'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
//this is the response
// {
//     "id": 15,
//     "user": "0123456789",
//     "Fname": "Allawy",
//     "location": "Faqous",
//     "approved": false,
//     "blood_group": null,
//     "date": "2023-05-16",
//     "time": "08:00:14.904749"
// }

          // signup(user);
//           var headers = {
//   'Content-Type': 'application/json'
// };
// var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/singup/'));
// request.body = json.encode({
          //here you can use the model insted of pass the values this way
//   "password": "",
//   "phone_num": "",
//   "email": "",
//   "Fname": "",
//   "DateOfBirth": "",
//   "location": ""
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
        });
      },
      phoneNumber: '0101021342',
      imageBlood: 'assets/O.png',
      personName: 'Ahmed allawy',
    );
  }
}

/// Self API (get)
/// {
/// bloog group,
/// name,
/// location,
/// phone number,
/// email
/// } i can make donate with these info
// / to get those enfo
//  var headers = {
//   'Authorization': 'Token a5fd5ff9e485f4938c0bd3606c1d5060c7e63821'
// };
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/getuser'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
