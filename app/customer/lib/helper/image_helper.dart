import '../features/splash/domain/models/config_model.dart';

String getImageUrl(
  String image,
  BaseUrls baseUrls, {
  bool isRestaurant = false,
  bool isCampaign = false,
}) {
  final baseUrl = (isCampaign
          ? baseUrls.campaignImageUrl
          : isRestaurant
              ? baseUrls.restaurantImageUrl
              : baseUrls.productImageUrl) ??
      '';
  if (image.contains('http')) {
    return image;
  }
  return '$baseUrl/$image';
}
