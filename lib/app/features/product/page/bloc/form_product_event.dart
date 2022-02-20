part of 'form_product_bloc.dart';

@immutable
abstract class FormProductEvent {}

class FormProductInitialEvent extends FormProductEvent {
  final ProductForm productForm;

  FormProductInitialEvent(this.productForm);
}

class FormProductSubmitEvent extends FormProductEvent {}

class FormProductChangeBrandEvent extends FormProductEvent {
  final Brand brandSelected;

  FormProductChangeBrandEvent({required this.brandSelected});
}

class FormProductChangePropsEvent extends FormProductEvent {
  final int? id;
  final String? name;
  final String? barCode;
  final String? category;
  final double? value;
  final String? image;
  final int? modelId;
  final Brand? brandSelected;
  final Model? modelSelected;

  FormProductChangePropsEvent({
    this.id,
    this.name,
    this.barCode,
    this.category,
    this.value,
    this.image,
    this.modelId,
    this.brandSelected,
    this.modelSelected,
  });
}
