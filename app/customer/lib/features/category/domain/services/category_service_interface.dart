import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/common/models/restaurant_model.dart';
import 'package:yum2go_v3_customer/features/category/domain/models/category_model.dart';
import 'package:get/get_connect/connect.dart';

abstract class CategoryServiceInterface {
  Future<List<CategoryModel>?> getCategoryList(
      bool reload, List<CategoryModel>? fetchedCategoryList);
  Future<List<CategoryModel>?> getSubCategoryList(String? parentID);
  Future<ProductModel?> getCategoryProductList(
      String? categoryID, int offset, String type);
  Future<RestaurantModel?> getCategoryRestaurantList(
      String? categoryID, int offset, String type);
  Future<Response> getSearchData(
      String? query, String? categoryID, bool isRestaurant, String type);
}
