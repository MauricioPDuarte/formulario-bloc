part of 'model_bloc.dart';

@immutable
abstract class ModelState {}

class ModelInitial extends ModelState {}

class ModelSuccessState extends ModelState {
  ModelSuccessState();
}

class ModelErrorState extends ModelState {
  final String message;

  ModelErrorState({required this.message});
}

class ModelLoadingState extends ModelState {}

class ModelChangeSelectedState extends ModelState {
  final Model? selectedModel;

  ModelChangeSelectedState({this.selectedModel});
}
