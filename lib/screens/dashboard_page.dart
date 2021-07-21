import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbr/models/locationModel.dart';
import 'package:sbr/models/ticket_model.dart';
import 'package:sbr/screens/new_ticket_page.dart';
import 'package:sbr/screens/profile_page.dart';
import 'package:sbr/screens/settings_page.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:sbr/services/api_path.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Open'),
    1: Text('Closed'),
  };
  int sharedValue = 0;

  Future<List<Ticket>> getUsers() async {
    Response response = await post(
      Uri.parse(URL.getProfile),
      body: jsonEncode(
          <String, String>{"access_token": "2IUOiHYVde0guY3R2JWtwg=="}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body["success"] == "true") {
        List<dynamic> listData = body["tickets"];
        List<Ticket> users =
            listData.map((json) => Ticket.fromJson(json)).toList();
        return users;
      }
      return [];
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            new IconButton(
                icon: new Icon(Icons.account_circle_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => SettingPage(),
                    ),
                  );
                })
          ],
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => NewTicketPage(),
                  ),
                );
              },
              child: Icon(
                Icons.add, // add custom icons also
              )),
          title: Text('Dashboard'),
          elevation: 0.0),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          SizedBox(
            width: 500.0,
            child: CupertinoSegmentedControl<int>(
              borderColor: Theme.of(context).primaryColor,
              selectedColor: Theme.of(context).primaryColor,
              unselectedColor: Theme.of(context).secondaryHeaderColor,
              children: logoWidgets,
              onValueChanged: (int val) {
                setState(() {
                  sharedValue = val;
                });
              },
              groupValue: sharedValue,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 16)),
          Expanded(
              child: FutureBuilder(
            future: getUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Ticket>> snapshot) {
              if (snapshot.hasData) {
                List<Ticket> posts = snapshot.data;
                return ListView(
                  children: posts
                      .map((ticket) => ListTile(
                            trailing: Icon(Icons.keyboard_arrow_right),
                            title: Text(ticket.title),
                            subtitle: Text('${ticket.initMessage}'),
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "/dashboard");
                            },
                          ))
                      .toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
        ],
      ),
    );
  }
}
