import 'dart:convert';

class Product {
  final int? id;
  final String name;
  final String barCode;
  final String category;
  final double value;
  final String image;
  final int? modelId;

  Product({
    this.id,
    required this.name,
    required this.barCode,
    required this.category,
    required this.value,
    required this.image,
    this.modelId,
  });

  Product.empty({
    this.name = '',
    this.barCode = '',
    this.category = '',
    this.value = 0,
    this.image = '',
    this.id,
    this.modelId,
  });

  Product copyWith({
    int? id,
    String? name,
    String? barCode,
    String? category,
    double? value,
    String? image,
    int? modelId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      barCode: barCode ?? this.barCode,
      category: category ?? this.category,
      value: value ?? this.value,
      image: image ?? this.image,
      modelId: modelId ?? this.modelId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'barCode': barCode,
      'category': category,
      'value': value,
      'image': image,
      'modelId': modelId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      barCode: map['barCode'] ?? '',
      category: map['category'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      modelId: map['modelId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, barCode: $barCode, category: $category, value: $value, image: $image, modelId: $modelId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.barCode == barCode &&
        other.category == category &&
        other.value == value &&
        other.image == image &&
        other.modelId == modelId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        barCode.hashCode ^
        category.hashCode ^
        value.hashCode ^
        image.hashCode ^
        modelId.hashCode;
  }
}
