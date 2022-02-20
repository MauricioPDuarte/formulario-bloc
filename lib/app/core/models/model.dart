import 'dart:convert';

import 'select_item.dart';

class Model {
  final int? id;
  final String name;
  final int brandId;

  Model({
    this.id,
    required this.name,
    required this.brandId,
  });

  Model copyWith({
    int? id,
    String? name,
    int? brandId,
  }) {
    return Model(
      id: id ?? this.id,
      name: name ?? this.name,
      brandId: brandId ?? this.brandId,
    );
  }

  static List<SelectItem> toSelectItem(List<Model> models) {
    return models
        .map((model) => SelectItem(id: model.id!, value: model.name))
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brandId': brandId,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      brandId: map['brandId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source));

  @override
  String toString() => 'Model(id: $id, name: $name, brandId: $brandId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Model &&
        other.id == id &&
        other.name == name &&
        other.brandId == brandId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ brandId.hashCode;
}
