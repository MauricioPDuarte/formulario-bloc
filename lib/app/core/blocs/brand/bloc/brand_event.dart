part of 'brand_bloc.dart';

@immutable
abstract class BrandEvent {}

class FetchAllBrandsEvent extends BrandEvent {}

class TestBrandEvent extends BrandEvent {}

class ChangeSelectedBrandEvent extends BrandEvent {
  final Brand selectedBrand;

  ChangeSelectedBrandEvent({required this.selectedBrand});
}
