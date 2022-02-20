import '../models/brand.dart';
import '../repositories/i_brand_repository.dart';
import 'i_brand_service.dart';

class BrandService extends IBrandService {
  IBrandRepository repository;

  BrandService(this.repository);

  @override
  Future<List<Brand>> fetchAll() async {
    return await repository.fetchAll();
  }
}
