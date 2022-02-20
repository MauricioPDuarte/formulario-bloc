import '../models/brand.dart';
import 'i_brand_repository.dart';

class BrandRepository extends IBrandRepository {
  @override
  Future<List<Brand>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));

    Brand brand1 = Brand(id: 1, name: 'Dell');
    Brand brand2 = Brand(id: 2, name: 'Samsung');
    Brand brand3 = Brand(id: 3, name: 'HP');

    return [brand1, brand2, brand3];
  }
}
