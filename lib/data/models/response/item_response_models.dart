// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemsResponseModel {
  final bool success;
  final String message;
  final List<Item> data;

  ItemsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ItemsResponseModel.fromJson(String str) =>
      ItemsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemsResponseModel.fromMap(Map<String, dynamic> json) =>
      ItemsResponseModel(
        success: json["success"],
        message: json["message"],
        data: List<Item>.from(json["data"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Item {
  final int? id;
  final String? userId;
  final int? itemId;
  final String namaItem;
  final String catatanTambahan;
  final String image;
  final String lokasi;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Item({
    this.id,
    this.userId,
    this.itemId,
    required this.namaItem,
    required this.catatanTambahan,
    required this.image,
    required this.lokasi,
    required this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        namaItem: json["nama_item"],
        catatanTambahan: json["catatan_tambahan"],
        image: json["image"],
        lokasi: json["lokasi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "item_id": itemId,
        "nama_item": namaItem,
        "catatan_tambahan": catatanTambahan,
        "image": image,
        "lokasi": lokasi,
        "created_at": DateTime.now(),
        // "updated_at": updatedAt.toIso8601String(),
      };

  Item copyWith({
    int? id,
    String? userId,
    int? itemId,
    String? namaItem,
    String? catatanTambahan,
    String? image,
    String? lokasi,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Item(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      itemId: itemId ?? this.itemId,
      namaItem: namaItem ?? this.namaItem,
      catatanTambahan: catatanTambahan ?? this.catatanTambahan,
      image: image ?? this.image,
      lokasi: lokasi ?? this.lokasi,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.itemId == itemId &&
        other.namaItem == namaItem &&
        other.catatanTambahan == catatanTambahan &&
        other.image == image &&
        other.lokasi == lokasi &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        itemId.hashCode ^
        namaItem.hashCode ^
        catatanTambahan.hashCode ^
        image.hashCode ^
        lokasi.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
