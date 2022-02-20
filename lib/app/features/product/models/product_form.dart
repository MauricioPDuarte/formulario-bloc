import 'package:forms_bloc/app/features/product/models/product.dart';

import '../../../core/models/brand.dart';
import '../../../core/models/model.dart';
import '../../../core/models/select_item.dart';

class ProductForm {
  final int? id;
  final String? name;
  final String? barCode;
  final String? category;
  final double? value;
  final String? image;
  final int? modelId;

  final Brand? brandSelected;
  final Model? modelSelected;

  final List<SelectItem>? brands;
  final List<SelectItem>? models;

  ProductForm({
    this.id,
    this.name,
    this.barCode,
    this.category,
    this.value,
    this.image,
    this.modelId,
    this.brands,
    this.models,
    this.brandSelected,
    this.modelSelected,
  });

  final bool isValid = false;

  ProductForm copyWith({
    int? id,
    String? name,
    String? barCode,
    String? category,
    double? value,
    String? image,
    int? modelId,
    List<SelectItem>? brands,
    List<SelectItem>? models,
    Brand? brandSelected,
    Model? modelSelected,
  }) {
    return ProductForm(
      id: id ?? this.id,
      name: name ?? this.name,
      barCode: barCode ?? this.barCode,
      category: category ?? this.category,
      value: value ?? this.value,
      image: image ?? this.image,
      modelId: modelId ?? this.modelId,
      brands: brands ?? this.brands,
      models: models ?? this.models,
      brandSelected: brandSelected ?? this.brandSelected,
      modelSelected: modelSelected ?? this.modelSelected,
    );
  }

  ProductForm copyWithBrandAndModelNull() {
    return ProductForm(
      id: id,
      name: name,
      barCode: barCode,
      category: category,
      value: value,
      image: image,
      modelId: modelId,
      brands: brands,
      models: models,
      brandSelected: null,
      modelSelected: null,
    );
  }
}
