// Dart models for the provided products JSON.
// Supports null-safety, immutable classes, copyWith, fromJson/toJson helpers,
// robust numeric parsing (int/double), and DateTime parsing.

import 'dart:convert';

// Top-level helpers -----------------------------------------------------------
ProductFeedModel productFeedFromJson(String source) => ProductFeedModel.fromJson(json.decode(source) as Map<String, dynamic>);

String productFeedToJson(ProductFeedModel feed) => json.encode(feed.toJson());

// Root container --------------------------------------------------------------
class ProductFeedModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  const ProductFeedModel({required this.products, required this.total, required this.skip, required this.limit});

  factory ProductFeedModel.fromJson(Map<String, dynamic> json) {
    return ProductFeedModel(products: (json['products'] as List<dynamic>? ?? const []).map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList(), total: (json['total'] as num? ?? 0).toInt(), skip: (json['skip'] as num? ?? 0).toInt(), limit: (json['limit'] as num? ?? 0).toInt());
  }

  Map<String, dynamic> toJson() => {'products': products.map((e) => e.toJson()).toList(), 'total': total, 'skip': skip, 'limit': limit};

  ProductFeedModel copyWith({List<ProductModel>? products, int? total, int? skip, int? limit}) => ProductFeedModel(products: products ?? this.products, total: total ?? this.total, skip: skip ?? this.skip, limit: limit ?? this.limit);
}

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;

  const ProductModel({required this.id, required this.title, required this.description, required this.category, required this.price, required this.discountPercentage, required this.rating, required this.stock, required this.thumbnail});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(id: (json['id'] as num).toInt(), title: json['title'] as String? ?? '', description: json['description'] as String? ?? '', category: json['category'] as String? ?? '', price: (json['price'] as num?)?.toDouble() ?? 0.0, discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0, rating: (json['rating'] as num?)?.toDouble() ?? 0.0, stock: (json['stock'] as num?)?.toInt() ?? 0, thumbnail: json['thumbnail'] as String? ?? '');
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'description': description, 'category': category, 'price': price, 'discountPercentage': discountPercentage, 'rating': rating, 'stock': stock, 'thumbnail': thumbnail};

  ProductModel copyWith({int? id, String? title, String? description, String? category, double? price, double? discountPercentage, double? rating, int? stock, String? thumbnail}) =>
      ProductModel(id: id ?? this.id, title: title ?? this.title, description: description ?? this.description, category: category ?? this.category, price: price ?? this.price, discountPercentage: discountPercentage ?? this.discountPercentage, rating: rating ?? this.rating, stock: stock ?? this.stock, thumbnail: thumbnail ?? this.thumbnail);
}

