import 'dart:convert';

class SelectItem {
  final int id;
  final String value;

  SelectItem({
    required this.id,
    required this.value,
  });

  SelectItem copyWith({
    int? id,
    String? value,
  }) {
    return SelectItem(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }

  factory SelectItem.fromMap(Map<String, dynamic> map) {
    return SelectItem(
      id: map['id']?.toInt() ?? 0,
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectItem.fromJson(String source) =>
      SelectItem.fromMap(json.decode(source));

  @override
  String toString() => 'SelectItem(id: $id, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectItem && other.id == id && other.value == value;
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode;
}
