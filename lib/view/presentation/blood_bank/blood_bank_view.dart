import 'package:blood_bank/view/presentation/blood_bank/widgets/blood_bank_view_body.dart';

import 'package:flutter/material.dart';

class BloodBankView extends StatefulWidget {
  const BloodBankView({super.key});

  @override
  State<BloodBankView> createState() => _BloodBankViewState();
}

class _BloodBankViewState extends State<BloodBankView> {
  @override
  Widget build(BuildContext context) {
    return const BloodBankViewBody();
  }
}

///// requests API(get all)
///{
///date, time, name, location, blood group, status(accepted or pendding)
///} i can change status
///****************************************/
///Donates API(get all)
///{
///date, time, name, location, blood group
///}
//////****************************************/
///Bank API(get all)
///{
///date, time, name, location, blood group
///} i can remove any item

// get all the blood request 
// { this is the data will come as us see there is id and approved 
//         "id": 1,
//         "user": "01154363771",
//         "Fname": "Ahmed Alaa Mohamed",
//         "location": "Zagazig",
//         "approved": true,
//         "blood_group": null,
//         "date": "2023-05-07",
//         "time": "00:43:01.556114"
//     },
// this is the code to get all the data 
// var headers = {
//   'Authorization': 'Token 08fda60e13a1e8adff11b07089d40db8fa7e03ec',
//   'Content-Type': 'application/json'
// };
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/blood/all/blood-requests/'));
// request.body = json.encode({
//   "email": "",
//   "password": "",
//   "Fname": "",
//   "DateOfBirth": null,
//   "phone_num": "",
//   "location": "",
//   "blood_group": null
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
// ------------------------------------------------------------------------------
// to apporve the blood requset this is the code for it 
// var headers = {
//   'Authorization': 'Token 08fda60e13a1e8adff11b07089d40db8fa7e03ec'
// };
// var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/blood/2/donate-approved/'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

// and this is the response 
// {
//     "message": "donate request has succfully updated "
// }
// for donates part the response will be the same ass the blood request 
// var headers = {
//   'Authorization': 'Token 08fda60e13a1e8adff11b07089d40db8fa7e03ec'
// };
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/blood/all/donate-requests/'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
