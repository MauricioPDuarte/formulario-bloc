part of 'form_product_bloc.dart';

@immutable
abstract class FormProductState {}

class FormProductInitialState extends FormProductState {
  final ProductForm productForm;

  FormProductInitialState(this.productForm);
}

class FormProductSubmitErrorState extends FormProductState {}

class FormProductChangeModelsState extends FormProductState {
  final List<SelectItem> models;

  FormProductChangeModelsState(this.models);
}

class FormProductFetchBrandsSuccess extends FormProductState {
  final List<SelectItem> brands;

  FormProductFetchBrandsSuccess(this.brands);
}

class FormProductChangePropsSuccess extends FormProductState {
  final ProductForm product;

  FormProductChangePropsSuccess(this.product);
}
