// To parse this JSON data, do
//
//     final userCall = userCallFromJson(jsonString);

import 'dart:convert';

UserCall userCallFromJson(String str) => UserCall.fromJson(json.decode(str));

String userCallToJson(UserCall data) => json.encode(data.toJson());

class UserCall {
    UserCall({
        this.name,
        this.image,
        this.updatesAt,
    });

    String? name;
    String? image;
    String ? updatesAt;

    factory UserCall.fromJson(Map<String, dynamic> json) => UserCall(
        name: json["name"],
        image: json["image"],
        updatesAt: json["updatesAt"],
    );

  get option => null;

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "updatesAt": updatesAt,
    };
}
