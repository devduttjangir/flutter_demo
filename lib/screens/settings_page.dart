import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                height: 100,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Other Information",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                      primary: Colors.white, // foreground
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/locations");
                  },
                  child: Text('LOGOUT'),
                ),
              )
            ],
          ),
        ));
  }
}
