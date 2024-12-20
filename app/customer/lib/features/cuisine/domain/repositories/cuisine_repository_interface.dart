import 'package:yum2go_v3_customer/features/cuisine/domain/models/cuisine_restaurants_model.dart';
import 'package:yum2go_v3_customer/interface/repository_interface.dart';

abstract class CuisineRepositoryInterface extends RepositoryInterface {
  Future<CuisineRestaurantModel?> getRestaurantList(int offset, int cuisineId);
}
