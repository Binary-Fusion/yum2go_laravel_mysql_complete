import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/helper/date_converter.dart';

class ProductHelper {
  static bool isAvailable(Product product) {
    return DateConverter.isAvailable(
        product.availableTimeStarts, product.availableTimeEnds);
  }

  static double? getDiscount(Product product) => product.restaurantDiscount == 0
      ? product.discount
      : product.restaurantDiscount;

  static String? getDiscountType(Product product) =>
      product.restaurantDiscount == 0 ? product.discountType : 'percent';
}
