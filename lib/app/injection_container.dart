import 'package:forms_bloc/app/core/blocs/brand/bloc/brand_bloc.dart';
import 'package:forms_bloc/app/core/blocs/model/bloc/model_bloc.dart';
import 'package:forms_bloc/app/features/product/page/bloc/form_product_bloc.dart';

import 'package:get_it/get_it.dart';

import 'core/repositories/brand_repository.dart';
import 'core/repositories/i_brand_repository.dart';
import 'core/repositories/i_model_repository.dart';
import 'core/repositories/model_repository.dart';
import 'core/services/brand_service.dart';
import 'core/services/i_brand_service.dart';
import 'core/services/i_model_service.dart';
import 'core/services/model_service.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<IModelRepository>(ModelRepository());
  sl.registerSingleton<IBrandRepository>(BrandRepository());

  sl.registerSingleton<IModelService>(ModelService(sl()));
  sl.registerSingleton<IBrandService>(BrandService(sl()));

  sl.registerLazySingleton(() => ModelBloc(service: sl()));
  sl.registerLazySingleton(() => BrandBloc(service: sl()));

  sl.registerLazySingleton(
    () => FormProductBloc(
      modelBloc: sl(),
      brandBloc: sl(),
    ),
  );
}
