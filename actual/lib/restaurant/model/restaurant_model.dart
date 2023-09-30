// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// enum RestaurantPriceRange { high, medium, low }

// class RestaurantModel {
//   final String id;
//   final String name;
//   final String thumbUrl;
//   final List<String> tags;
//   final RestaurantPriceRange priceRange;
//   final double ratings;
//   final int ratingsCount;
//   final int deliveryTime;
//   final int deliveryFee;

//   RestaurantModel({
//     required this.id,
//     required this.name,
//     required this.thumbUrl,
//     required this.tags,
//     required this.priceRange,
//     required this.ratings,
//     required this.ratingsCount,
//     required this.deliveryTime,
//     required this.deliveryFee,
//   });

//   RestaurantModel copyWith({
//     String? id,
//     String? name,
//     String? thumbUrl,
//     List<String>? tags,
//     RestaurantPriceRange? priceRange,
//     double? ratings,
//     int? ratingsCount,
//     int? deliveryTime,
//     int? deliveryFee,
//   }) {
//     return RestaurantModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       thumbUrl: thumbUrl ?? this.thumbUrl,
//       tags: tags ?? this.tags,
//       priceRange: priceRange ?? this.priceRange,
//       ratings: ratings ?? this.ratings,
//       ratingsCount: ratingsCount ?? this.ratingsCount,
//       deliveryTime: deliveryTime ?? this.deliveryTime,
//       deliveryFee: deliveryFee ?? this.deliveryFee,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'thumbUrl': thumbUrl,
//       'tags': tags,
//       'priceRange': priceRange.toMap(),
//       'ratings': ratings,
//       'ratingsCount': ratingsCount,
//       'deliveryTime': deliveryTime,
//       'deliveryFee': deliveryFee,
//     };
//   }

//   factory RestaurantModel.fromMap(Map<String, dynamic> map) {
//     return RestaurantModel(
//       id: map['id'] as String,
//       name: map['name'] as String,
//       thumbUrl: map['thumbUrl'] as String,
//       tags: List<String>.from((map['tags'] as List<String>),
//       priceRange: RestaurantPriceRange.fromMap(map['priceRange'] as Map<String,dynamic>),
//       ratings: map['ratings'] as double,
//       ratingsCount: map['ratingsCount'] as int,
//       deliveryTime: map['deliveryTime'] as int,
//       deliveryFee: map['deliveryFee'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory RestaurantModel.fromJson(String source) => RestaurantModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'RestaurantModel(id: $id, name: $name, thumbUrl: $thumbUrl, tags: $tags, priceRange: $priceRange, ratings: $ratings, ratingsCount: $ratingsCount, deliveryTime: $deliveryTime, deliveryFee: $deliveryFee)';
//   }

//   @override
//   bool operator ==(covariant RestaurantModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.id == id &&
//       other.name == name &&
//       other.thumbUrl == thumbUrl &&
//       listEquals(other.tags, tags) &&
//       other.priceRange == priceRange &&
//       other.ratings == ratings &&
//       other.ratingsCount == ratingsCount &&
//       other.deliveryTime == deliveryTime &&
//       other.deliveryFee == deliveryFee;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//       name.hashCode ^
//       thumbUrl.hashCode ^
//       tags.hashCode ^
//       priceRange.hashCode ^
//       ratings.hashCode ^
//       ratingsCount.hashCode ^
//       deliveryTime.hashCode ^
//       deliveryFee.hashCode;
//   }
// }
