import 'dart:convert';

class Item {
  final String storeTitle, address, imgPath, tags, description;
  final double distance, rating, price;
  final int checkIns;

  Item(
      {this.storeTitle,
      this.address,
      this.imgPath,
      this.tags,
      this.description,
      this.distance,
      this.rating,
      this.price,
      this.checkIns});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      storeTitle: json['storeTitle'] as String,
      address: json['address'] as String,
      imgPath: json['imgPath'] as String,
      tags: json['tags'] as String,
      description: json['description'] as String,
      distance: json['distance'] as double,
      rating: json['rating'] as double,
      price: json['price'] as double,
      checkIns: json['checkIns'] as int,
    );
  }

  static List<Item> parseJson(String response) {
    if (response == null) return [];

    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => new Item.fromJson(json)).toList();
  }

  @override
  int get hashCode => storeTitle.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Item && other.storeTitle == storeTitle;
}
