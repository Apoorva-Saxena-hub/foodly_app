// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RestaurantModel> restaurantModelFromJson(String str) => List<RestaurantModel>.from(json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final List<dynamic> foods;
    final String pickup;
    final bool delivery;
    final bool isAvailable;
    final String owner;
    final String code;
    final String logoUrl;
    final int rating;
    final String ratingCount;
    final String verification;
    final String verificationMessage;
    final Coords coords;

    RestaurantModel({
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.foods,
        required this.pickup,
        required this.delivery,
        required this.isAvailable,
        required this.owner,
        required this.code,
        required this.logoUrl,
        required this.rating,
        required this.ratingCount,
        required this.verification,
        required this.verificationMessage,
        required this.coords,
    });

    RestaurantModel copyWith({
        String? id,
        String? title,
        String? time,
        String? imageUrl,
        List<dynamic>? foods,
        String? pickup,
        bool? delivery,
        bool? isAvailable,
        String? owner,
        String? code,
        String? logoUrl,
        int? rating,
        String? ratingCount,
        String? verification,
        String? verificationMessage,
        Coords? coords,
    }) => 
        RestaurantModel(
            id: id ?? this.id,
            title: title ?? this.title,
            time: time ?? this.time,
            imageUrl: imageUrl ?? this.imageUrl,
            foods: foods ?? this.foods,
            pickup: pickup ?? this.pickup,
            delivery: delivery ?? this.delivery,
            isAvailable: isAvailable ?? this.isAvailable,
            owner: owner ?? this.owner,
            code: code ?? this.code,
            logoUrl: logoUrl ?? this.logoUrl,
            rating: rating ?? this.rating,
            ratingCount: ratingCount ?? this.ratingCount,
            verification: verification ?? this.verification,
            verificationMessage: verificationMessage ?? this.verificationMessage,
            coords: coords ?? this.coords,
        );

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailable: json["isAvailable"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        coords: Coords.fromJson(json["coords"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "foods": List<dynamic>.from(foods.map((x) => x)),
        "pickup": pickup,
        "delivery": delivery,
        "isAvailable": isAvailable,
        "owner": owner,
        "code": code,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "verificationMessage": verificationMessage,
        "coords": coords.toJson(),
    };
}

class Coords {
    final String id;
    final double latitude;
    final double longitude;
    final String address;
    final String title;
    final double latitudeDelta;
    final double longitudeDelta;

    Coords({
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.address,
        required this.title,
        required this.latitudeDelta,
        required this.longitudeDelta,
    });

    Coords copyWith({
        String? id,
        double? latitude,
        double? longitude,
        String? address,
        String? title,
        double? latitudeDelta,
        double? longitudeDelta,
    }) => 
        Coords(
            id: id ?? this.id,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            address: address ?? this.address,
            title: title ?? this.title,
            latitudeDelta: latitudeDelta ?? this.latitudeDelta,
            longitudeDelta: longitudeDelta ?? this.longitudeDelta,
        );

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        address: json["address"],
        title: json["title"],
        latitudeDelta: json["latitudeDelta"].toDouble(),
        longitudeDelta: json["longitudeDelta"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
    };
}
