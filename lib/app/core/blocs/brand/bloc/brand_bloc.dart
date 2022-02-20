import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/brand.dart';
import '../../../services/i_brand_service.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final IBrandService service;

  List<Brand> _brands = [];
  Brand? _selectedBrand;

  List<Brand> get brands => _brands;
  Brand? get selectedBrand => _selectedBrand;

  BrandBloc({required this.service}) : super(BrandInitial()) {
    on<FetchAllBrandsEvent>(_fetchAll);
    on<ChangeSelectedBrandEvent>(_changeSelectedBrand);
  }

  _fetchAll(FetchAllBrandsEvent event, Emitter<BrandState> emit) async {
    try {
      emit(BrandLoadingState());

      _brands = await service.fetchAll();

      emit(BrandSuccessState());
    } catch (e) {
      emit(BrandErrorState(message: e.toString()));
    }
  }

  _changeSelectedBrand(
      ChangeSelectedBrandEvent event, Emitter<BrandState> emit) {
    _selectedBrand = event.selectedBrand;

    emit(BrandChangeSelectedState(selectedBrand: _selectedBrand!));
  }
}
