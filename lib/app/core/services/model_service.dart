import '../models/model.dart';
import '../repositories/i_model_repository.dart';
import 'i_model_service.dart';

class ModelService extends IModelService {
  IModelRepository repository;

  ModelService(this.repository);

  @override
  Future<List<Model>> fetchAll({required int brandId}) async {
    return await repository.fetchAll(brandId: brandId);
  }
}
