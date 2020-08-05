import 'dart:convert';

class Item {
  final String storeTitle, address, imgUrl, tags;
  final double distance, rating;
  final int checkIns;

  Item(
      {this.storeTitle,
      this.address,
      this.imgUrl,
      this.tags,
      this.distance,
      this.rating,
      this.checkIns});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      storeTitle: json['storeTitle'] as String,
      address: json['address'] as String,
      imgUrl: json['imgUrl'] as String,
      tags: json['tags'] as String,
      distance: json['distance'] as double,
      rating: json['rating'] as double,
      checkIns: json['checkIns'] as int,
    );
  }

  static List<Item> parseJson(String response) {
    if (response == null) return [];

    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => new Item.fromJson(json)).toList();
  }
}
