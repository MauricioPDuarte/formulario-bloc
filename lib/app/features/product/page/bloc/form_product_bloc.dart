import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:forms_bloc/app/core/blocs/model/bloc/model_bloc.dart';
import 'package:forms_bloc/app/features/product/models/product_form.dart';
import 'package:meta/meta.dart';

import '../../../../core/blocs/brand/bloc/brand_bloc.dart';
import '../../../../core/models/brand.dart';
import '../../../../core/models/model.dart';
import '../../../../core/models/select_item.dart';

part 'form_product_event.dart';
part 'form_product_state.dart';

class FormProductBloc extends Bloc<FormProductEvent, FormProductState> {
  ProductForm _productForm = ProductForm();
  final ModelBloc modelBloc;
  final BrandBloc brandBloc;
  late final StreamSubscription brandBlocSubscription;
  late final StreamSubscription modelBlocSubscription;

  FormProductBloc({required this.modelBloc, required this.brandBloc})
      : super(FormProductInitialState(ProductForm())) {
    on<FormProductChangePropsEvent>(_changePropsProduct);
    on<FormProductSubmitEvent>(_onSubmit);
    on<FormProductChangeBrandEvent>(_changeBrand);

    brandBlocSubscription = brandBloc.stream.listen((state) {
      if (state is BrandChangeSelectedState) {
        add(FormProductChangeBrandEvent(brandSelected: state.selectedBrand));
      }
    });

    modelBlocSubscription = modelBloc.stream.listen((state) {
      if (state is ModelChangeSelectedState) {
        add(FormProductChangePropsEvent(modelSelected: state.selectedModel));
      }
    });
  }

  ProductForm get productForm => _productForm;

  _changeBrand(
    FormProductChangeBrandEvent event,
    Emitter<FormProductState> emit,
  ) {
    _productForm = _productForm.copyWithBrandAndModelNull();

    _productForm = _productForm.copyWith(
        brandSelected: event.brandSelected, modelSelected: null);
    //brandBloc.add();

    emit(FormProductChangePropsSuccess(_productForm));

    modelBloc.add(ChangeSelectedModelEvent(selectedModel: null));
    // Lança um evento para o BLOC de modelos, fazendo que o mesmo recarregue
    // a lista de modelos de acordo com a marca selecionada...
    modelBloc.add(FetchAllModelsEvent(brandId: event.brandSelected.id!));
  }

  _changePropsProduct(
    FormProductChangePropsEvent event,
    Emitter<FormProductState> emit,
  ) {
    _productForm = _productForm.copyWith(
      barCode: event.barCode,
      brandSelected: event.brandSelected,
      category: event.category,
      id: event.id,
      image: event.image,
      name: event.name,
      modelSelected: event.modelSelected,
      value: event.value,
    );

    emit(FormProductChangePropsSuccess(_productForm));
  }

  _onSubmit(FormProductSubmitEvent event, Emitter<FormProductState> emit) {
    if (!_productForm.isValid) {
      return emit(FormProductSubmitErrorState());
    }
  }

  @override
  Future<void> close() {
    brandBlocSubscription.cancel();
    return super.close();
  }
}
