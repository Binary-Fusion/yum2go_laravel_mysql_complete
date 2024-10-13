import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/common/models/response_model.dart';
import 'package:yum2go_v3_customer/common/models/review_model.dart';
import 'package:yum2go_v3_customer/features/product/domain/models/review_body_model.dart';
import 'package:yum2go_v3_customer/features/review/domain/repositories/review_repository_interface.dart';
import 'package:yum2go_v3_customer/features/review/domain/services/review_service_interface.dart';

class ReviewService implements ReviewServiceInterface {
  final ReviewRepositoryInterface reviewRepositoryInterface;
  ReviewService({required this.reviewRepositoryInterface});

  @override
  Future<List<Product>?> getReviewedProductList({required String type}) async {
    return await reviewRepositoryInterface.getList(type: type);
  }

  @override
  Future<ResponseModel> submitProductReview(ReviewBodyModel reviewBody) async {
    return await reviewRepositoryInterface.submitReview(reviewBody, true);
  }

  @override
  Future<ResponseModel> submitDeliverymanReview(
      ReviewBodyModel reviewBody) async {
    return await reviewRepositoryInterface.submitReview(reviewBody, false);
  }

  @override
  Future<List<ReviewModel>?> getRestaurantReviewList(
      String? restaurantID) async {
    return await reviewRepositoryInterface
        .getRestaurantReviewList(restaurantID);
  }
}
