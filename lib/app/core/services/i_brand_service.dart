import '../models/brand.dart';

abstract class IBrandService {
  Future<List<Brand>> fetchAll();
}
