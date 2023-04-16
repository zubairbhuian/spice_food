// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardModel {
  int? id;
  String? name;
  int? price;
  String? image;
  String? quantity;
  bool? isExit;
  String? time;
  CardModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.isExit,
    this.time,
  });

  CardModel copyWith({
    int? id,
    String? name,
    int? price,
    String? image,
    String? quantity,
    bool? isExit,
    String? time,
  }) {
    return CardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      isExit: isExit ?? this.isExit,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'isExit': isExit,
      'time': time,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as String : null,
      isExit: map['isExit'] != null ? map['isExit'] as bool : null,
      time: map['time'] != null ? map['time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardModel(id: $id, name: $name, price: $price, image: $image, quantity: $quantity, isExit: $isExit, time: $time)';
  }

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.image == image &&
      other.quantity == quantity &&
      other.isExit == isExit &&
      other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      quantity.hashCode ^
      isExit.hashCode ^
      time.hashCode;
  }
}
