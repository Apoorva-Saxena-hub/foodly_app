import 'package:foodly_app/models/food.dart';

class RestaurantModel {
  String? sId;
  String? title;
  String? time;
  String? imageUrl;
  List<FoodsModel>? foods;
  String? pickup;
  bool? delivery;
  bool? isAvailable;
  String? owner;
  String? code;
  String? logoUrl;
  int? rating;
  String? ratingCount;
  String? verification;
  String? verificationMessage;
  Coords? coords;

  RestaurantModel({
    required this.sId,
    this.title,
    this.time,
    this.imageUrl,
    required this.foods,
    this.pickup,
    required this.delivery,
    required this.isAvailable,
    this.owner,
    required this.code,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.verificationMessage,
    required this.coords,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    if (json['foods'] != null) {
      foods = (json['foods'] as List)
          .map((v) => FoodsModel.fromJson(v))
          .toList();
    }
    pickup = json['pickup'];
    delivery = json['delivery'];
    isAvailable = json['isAvailable'];
    owner = json['owner'];
    code = json['code'];
    logoUrl = json['logoUrl'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    verification = json['verification'];
    verificationMessage = json['verificationMessage'];
    coords = json['coords'] != null
        ? new Coords.fromJson(json['coords'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['time'] = this.time;
    data['imageUrl'] = this.imageUrl;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    data['pickup'] = this.pickup;
    data['delivery'] = this.delivery;
    data['isAvailable'] = this.isAvailable;
    data['owner'] = this.owner;
    data['code'] = this.code;
    data['logoUrl'] = this.logoUrl;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['verification'] = this.verification;
    data['verificationMessage'] = this.verificationMessage;
    if (this.coords != null) {
      data['coords'] = this.coords!.toJson();
    }
    return data;
  }
}

class Coords {
  String? id;
  double? latitude;
  double? longitude;
  String? address;
  String? title;
  double? latitudeDelta;
  double? longitudeDelta;

  Coords({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  Coords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    title = json['title'];
    latitudeDelta = json['latitudeDelta'];
    longitudeDelta = json['longitudeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['title'] = this.title;
    data['latitudeDelta'] = this.latitudeDelta;
    data['longitudeDelta'] = this.longitudeDelta;
    return data;
  }
}
