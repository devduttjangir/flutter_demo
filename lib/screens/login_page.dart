import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sbr/screens/otp_page.dart';
import 'package:sbr/services/api_path.dart';
import 'package:sbr/widgets/loading_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String errorMessage = "";
  bool isLoading = false;

  login(String username) async {
    Response response = await post(
      Uri.parse(URL.login),
      body: jsonEncode(<String, String>{
        'mobilenumber': username,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      if (map["success"] == "true") {
        setState(() {
          errorMessage = "";
          isLoading = false;
        });
        // Navigator.pushReplacementNamed(context, "/locations");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OTPView()));
      } else {
        print("login failed");
        setState(() {
          errorMessage = "Invalid Credentials";
          isLoading = false;
        });
      }
    }
    print(response.body);
    // final response = await get(
    //   Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    // );
    // print(response.body);
    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   return true;
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
  }

  void buttonLoginTapped() async {
    setState(() {
      isLoading = true;
    });
    await login("9729615689");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  errorMessage.length > 0 ? errorMessage : "",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Enter mobile number',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 8),
                                      shape: StadiumBorder(),
                                      primary: Colors.white, // foreground
                                      backgroundColor:
                                          Theme.of(context).primaryColor),
                                  onPressed: () {
                                    //Navigator.pushReplacementNamed(context, "/locations");
                                    buttonLoginTapped();
                                  },
                                  child: Text('LOGIN'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          if (isLoading) LoadingView()
        ],
      ),
    );
  }
}
