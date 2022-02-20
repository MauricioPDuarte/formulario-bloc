import '../models/model.dart';

abstract class IModelRepository {
  Future<List<Model>> fetchAll({required int brandId});
}
