import 'package:yum2go_v3_customer/features/category/domain/models/category_model.dart';

abstract class InterestServiceInterface {
  List<bool>? processCategorySelectedList(List<CategoryModel>? categoryList);
  Future<bool> saveUserInterests(List<int?> interests);
}
