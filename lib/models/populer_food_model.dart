// To parse this JSON data, do
//
//     final populerFoodModel = populerFoodModelFromJson(jsonString);

import 'dart:convert';

List<PopulerFoodModel> populerFoodModelFromJson(String str) => List<PopulerFoodModel>.from(json.decode(str).map((x) => PopulerFoodModel.fromJson(x)));

String populerFoodModelToJson(List<PopulerFoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopulerFoodModel {
    PopulerFoodModel({
        this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
       required this.createdAt,
       required this.updatedAt,
        this.typeId,
    });

    int? id;
    String? name;
    String? description;
    int? price;
    int? stars;
    String? img;
    String ?location;
    DateTime createdAt;
    DateTime updatedAt;
    int? typeId;

    factory PopulerFoodModel.fromJson(Map<String, dynamic> json) => PopulerFoodModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        typeId: json["type_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type_id": typeId,
    };
}