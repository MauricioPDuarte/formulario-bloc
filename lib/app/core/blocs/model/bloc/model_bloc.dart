import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/model.dart';
import '../../../services/i_model_service.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final IModelService service;

  Model? _selectedModel;

  List<Model> _models = [];

  List<Model> get models => _models;
  Model? get selectedModel => _selectedModel;

  ModelBloc({required this.service}) : super(ModelInitial()) {
    on<FetchAllModelsEvent>(_fetchAll);
    on<ChangeSelectedModelEvent>(_changeSelected);
  }

  _changeSelected(ChangeSelectedModelEvent event, Emitter<ModelState> emit) {
    _selectedModel = event.selectedModel;

    emit(ModelChangeSelectedState(selectedModel: _selectedModel));
  }

  _fetchAll(FetchAllModelsEvent event, Emitter<ModelState> emit) async {
    try {
      emit(ModelLoadingState());

      _models = await service.fetchAll(brandId: event.brandId);

      emit(ModelSuccessState());
    } catch (e) {
      emit(ModelErrorState(message: e.toString()));
    }
  }
}
