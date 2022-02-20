import 'dart:convert';

import 'package:forms_bloc/app/core/models/select_item.dart';

import 'select_item.dart';

class Brand {
  final int? id;
  final String name;

  Brand({
    this.id,
    required this.name,
  });

  Brand copyWith({
    int? id,
    String? name,
  }) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static List<SelectItem> toSelectItem(List<Brand> brands) {
    return brands
        .map((brand) => SelectItem(id: brand.id!, value: brand.name))
        .toList();
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) => Brand.fromMap(json.decode(source));

  @override
  String toString() => 'Brand(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Brand && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
