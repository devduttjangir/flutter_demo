import 'dart:convert';
import 'package:http/http.dart';
import 'package:sbr/services/api_path.dart';

import 'package:flutter/material.dart';
import 'package:sbr/models/user_model.dart';

class LocationListPage extends StatelessWidget {
  Future<List<User>> getUsers() async {
    Response response = await post(
      Uri.parse(URL.profileList),
      body: jsonEncode(
          <String, String>{"access_token": "2IUOiHYVde0guY3R2JWtwg=="}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body["success"] == "true") {
        List<dynamic> listData = body["data"];
        List<User> users = listData.map((json) => User.fromJson(json)).toList();
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
          automaticallyImplyLeading: false,
          title: Text("Locations",
              style: TextStyle(color: Theme.of(context).secondaryHeaderColor)),
        ),
        body: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              List<User> posts = snapshot.data;
              return ListView(
                children: posts
                    .map((post) => ListTile(
                          trailing: Icon(Icons.keyboard_arrow_right),
                          title: Text(post.name),
                          subtitle:
                              Text('${post.city} ${post.state} ${post.zip}'),
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
        ));
  }
}
