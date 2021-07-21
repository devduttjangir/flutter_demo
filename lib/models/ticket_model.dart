class Ticket {
  // "id": "1",
  //           "client_id": "5185",
  //           "user_id": "3",
  //           "title": "Get issue with speed",
  //           "issue": "Internet speed issue",
  //           "init_msg": "Get i seens morningssue with speed",
  //           "img": null,
  //           "date": "2021-06-20 08:37:31",
  //           "status": "Open"
  final String id;
  final String clientId;
  final String userId;
  final String title;
  final String issue;
  final String initMessage;
  final String img;
  final String date;
  final String status;

  Ticket(
      {this.id,
      this.clientId,
      this.userId,
      this.title,
      this.issue,
      this.initMessage,
      this.img,
      this.date,
      this.status});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        id: json["id"] as String,
        clientId: json["client_id"] as String,
        userId: json["client_id"] as String,
        title: json["title"] as String,
        issue: json["issue"] as String,
        initMessage: json["init_msg"] as String,
        img: json["img"] as String,
        date: json["date"] as String,
        status: json["status"] as String);
  }
}
