import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:sbr/screens/dashboard_page.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:sbr/services/api_path.dart';

class OTPView extends StatelessWidget {
  // logic to validate otp return [null] when success else error [String]
  Future<String> validateOtp(String otp) async {
    Response response = await post(
      Uri.parse(URL.verifyOTP),
      body: jsonEncode(
          <String, String>{'mobilenumber': "9729615689", 'otp': otp}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      if (map["success"] == "true") {
        return null;
      }
      return "The entered Otp is wrong";
    } else {
      return "The entered Otp is wrong";
    }
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
    Navigator.pushReplacementNamed(context, "/locations");
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // initialize the OTP screen by passing validation logic and route callback
      body: OtpScreen(
        otpLength: 4,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        titleColor: Colors.black,
        themeColor: Colors.black,
      ),
    );
  }
}
