part of 'brand_bloc.dart';

@immutable
abstract class BrandState {}

class BrandInitial extends BrandState {}

class BrandSuccessState extends BrandState {
  BrandSuccessState();
}

class BrandErrorState extends BrandState {
  final String message;

  BrandErrorState({required this.message});
}

class BrandLoadingState extends BrandState {}

class BrandChangeSelectedState extends BrandState {
  final Brand selectedBrand;

  BrandChangeSelectedState({required this.selectedBrand});
}
