// Dart models for Product Feed with nested Category objects.
// Immutable, null-safe, with copyWith, fromJson/toJson helpers, and robust parsing.

import 'dart:convert';

// -----------------------------------------------------------------------------
// Top-level helpers
// -----------------------------------------------------------------------------
ProductFetchModel productFeedFromJson(String source) =>
    ProductFetchModel.fromJson(json.decode(source) as Map<String, dynamic>);

String productFeedToJson(ProductFetchModel feed) => json.encode(feed.toJson());

// -----------------------------------------------------------------------------
// Root container (Feed)
// -----------------------------------------------------------------------------
class ProductFetchModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  const ProductFetchModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductFetchModel.fromJson(Map<String, dynamic> json) {
    return ProductFetchModel(
      products: (json['products'] as List<dynamic>? ?? const [])
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  ProductFetchModel copyWith({
    List<ProductModel>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductFetchModel(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }
}

// -----------------------------------------------------------------------------
// Product Model
// -----------------------------------------------------------------------------
class ProductModel {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final Category category;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;

  const ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      description: json['description'] as String? ?? '',
      category: Category.fromJson(json['category'] as Map<String, dynamic>? ?? {}),
      images: (json['images'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
      creationAt: DateTime.tryParse(json['creationAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'price': price,
        'description': description,
        'category': category.toJson(),
        'images': images,
        'creationAt': creationAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  ProductModel copyWith({
    int? id,
    String? title,
    String? slug,
    double? price,
    String? description,
    Category? category,
    List<String>? images,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      images: images ?? this.images,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

// -----------------------------------------------------------------------------
// Category Model
// -----------------------------------------------------------------------------
class Category {
  final int id;
  final String name;
  final String slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  const Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      image: json['image'] as String? ?? '',
      creationAt: DateTime.tryParse(json['creationAt']?.toString() ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'image': image,
        'creationAt': creationAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  Category copyWith({
    int? id,
    String? name,
    String? slug,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      image: image ?? this.image,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
