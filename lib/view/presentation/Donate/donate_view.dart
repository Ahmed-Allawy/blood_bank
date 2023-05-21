// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:blood_bank/model/bloodImages.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
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
      email: CacheHelper.getData(key: 'userEmail'),
      location: CacheHelper.getData(key: 'userLocation'),
      phoneNumber: (CacheHelper.getData(key: 'userPhoneNumber')).toString(),
      imageBlood: BloodImages(CacheHelper.getData(key: 'userBloodType'))
          .getBloodImages(),
      personName: CacheHelper.getData(key: 'userName'),
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
