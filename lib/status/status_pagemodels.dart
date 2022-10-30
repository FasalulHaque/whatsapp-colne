// To parse this JSON data, do
//
//     final staatus = staatusFromJson(jsonString);

import 'dart:convert';

Staatus staatusFromJson(String str) => Staatus.fromJson(json.decode(str));

String staatusToJson(Staatus data) => json.encode(data.toJson());

class Staatus {
    Staatus({
        this.name,
        this.image,
        this.updatesAt,
    });

    String ?name;
    String ?image;
    String ?updatesAt;

    factory Staatus.fromJson(Map<String, dynamic> json) => Staatus(
        name: json["name"],
        image: json["image"],
        updatesAt: json["updatesAt"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "updatesAt": updatesAt,
    };
}
