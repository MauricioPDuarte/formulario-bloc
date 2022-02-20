part of 'model_bloc.dart';

@immutable
abstract class ModelEvent {}

class InitialEvent extends ModelEvent {}

class FetchAllModelsEvent extends ModelEvent {
  final int brandId;

  FetchAllModelsEvent({required this.brandId});
}

class ChangeSelectedModelEvent extends ModelEvent {
  final Model? selectedModel;

  ChangeSelectedModelEvent({this.selectedModel});
}
