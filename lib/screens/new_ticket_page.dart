import 'package:flutter/material.dart';

class NewTicketPage extends StatefulWidget {
  @override
  _NewTicketPageState createState() => _NewTicketPageState();
}

class _NewTicketPageState extends State<NewTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Ticket")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Request Title",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter title',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                "Request Description",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Description',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                        primary: Colors.white, // foreground
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/locations");
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
