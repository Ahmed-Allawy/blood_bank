import 'package:blood_bank/view/presentation/blood_bank/widgets/blood_bank_view_body.dart';

import 'package:flutter/material.dart';

import '../../shared/component/helperfunctions.dart';
import '../../shared/network/local/cach_helper.dart';
import '../auth/login/login.dart';
import 'package:http/http.dart' as http;

class BloodBankView extends StatefulWidget {
  const BloodBankView({super.key});

  @override
  State<BloodBankView> createState() => _BloodBankViewState();
}

class _BloodBankViewState extends State<BloodBankView> {
  @override
  Widget build(BuildContext context) {
    return BloodBankViewBody(
      exitButton: () {
        logout();
        CacheHelper.removeData(key: 'token');
        CacheHelper.removeData(key: 'userEmail');
        CacheHelper.removeData(key: 'userPhoneNumber');
        CacheHelper.removeData(key: 'userName');
        CacheHelper.removeData(key: 'userDate');
        CacheHelper.removeData(key: 'userLocation');
        CacheHelper.removeData(key: 'userBloodType');
        nextScreen(context, const LogIn());
      },
    );
  }
}

logout() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request =
      http.Request('POST', Uri.parse('http://127.0.0.1:8000/logout/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
  } else {}
}
