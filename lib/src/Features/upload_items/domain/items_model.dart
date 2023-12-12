import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  final String itemId;
  String? name;
  String? disorderType;
  String? dateOfExpire;

  Items(
      {required this.itemId,
      required this.name,
      required this.disorderType,
      required this.dateOfExpire});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
      itemId: json["itemId"],
      name: json["name"],
      disorderType: json["disorderType"],
      dateOfExpire: json["dateOfExpire"]);
}
