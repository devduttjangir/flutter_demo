// "client_id": "5185",
//      "user_id": "3",
//             "Name": "rerew",
//             "Company_Name": "dsdas",
//             "emailAddress": "hyadav816@gmail.com",
//             "mobilenumber": "9729615689",
//             "bill_value": "800",
//             "address": "dsadsad",
//             "city": "sdasdas",
//             "state": "cvc",
//             "ZIP": "121212",
//             "latitude": "0.00",
//             "longitude": "0.23",
//             "refundable_amount": "2001"

class User {
  final String clientId;
  final String userId;
  final String name;
  final String companyName;
  final String emailAddress;
  final String mobileNumber;
  final String billValue;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String latitude;
  final String longitude;
  final String refundableAmount;

  User(
      {this.clientId,
      this.userId,
      this.name,
      this.companyName,
      this.emailAddress,
      this.mobileNumber,
      this.billValue,
      this.address,
      this.city,
      this.state,
      this.zip,
      this.latitude,
      this.longitude,
      this.refundableAmount});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        clientId: json["client_id"] as String,
        userId: json["user_id"] as String,
        name: json["Name"] as String,
        companyName: json["Company_Name"] as String,
        emailAddress: json["emailAddress"] as String,
        mobileNumber: json["mobilenumber"] as String,
        billValue: json["bill_value"] as String,
        address: json["address"] as String,
        city: json["city"] as String,
        state: json["state"] as String,
        zip: json["ZIP"] as String,
        latitude: json["latitude"] as String,
        longitude: json["longitude"] as String,
        refundableAmount: json["refundable_amount"] as String);
  }
}
