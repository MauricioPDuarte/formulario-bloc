import '../models/model.dart';

abstract class IModelService {
  Future<List<Model>> fetchAll({required int brandId});
}
