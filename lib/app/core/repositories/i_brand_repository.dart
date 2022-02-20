import '../models/brand.dart';

abstract class IBrandRepository {
  Future<List<Brand>> fetchAll();
}
