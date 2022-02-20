import '../models/model.dart';
import 'i_model_repository.dart';

class ModelRepository extends IModelRepository {
  @override
  Future<List<Model>> fetchAll({required int brandId}) async {
    await Future.delayed(const Duration(seconds: 2));

    //DEll (Modelos)
    Model model1 = Model(id: 1, name: "Inspiron 2400", brandId: 1);
    Model model2 = Model(id: 2, name: "Inspiron 2500", brandId: 1);
    Model model3 = Model(id: 3, name: "Inspiron 2600", brandId: 1);

    //Samsung (Modelos)
    Model model4 = Model(id: 4, name: "Ultrabook 1000", brandId: 2);
    Model model5 = Model(id: 5, name: "Book 2000", brandId: 2);
    Model model6 = Model(id: 6, name: "Inspiron 2600", brandId: 2);

    //HP (Modelos)
    Model model7 = Model(id: 4, name: "Hp 1000", brandId: 3);
    Model model8 = Model(id: 5, name: "Hp 2000", brandId: 3);
    Model model9 = Model(id: 6, name: "Hp 2600", brandId: 3);

    List<Model> models = [
      model1,
      model2,
      model3,
      model4,
      model5,
      model6,
      model7,
      model8,
      model9,
    ];

    return models.where((model) => model.brandId == brandId).toList();
  }
}
