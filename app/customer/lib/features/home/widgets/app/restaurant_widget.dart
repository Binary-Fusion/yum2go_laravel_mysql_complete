// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/common/models/restaurant_model.dart';

import '../../../../common/widgets/custom_favourite_widget.dart';
import '../../../../common/widgets/custom_image_widget.dart';
import '../../../../common/widgets/custom_snackbar_widget.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../favourite/controllers/favourite_controller.dart';
import '../../../restaurant/screens/restaurant_screen.dart';
import '../../../splash/controllers/splash_controller.dart';
import '../icon_with_text_row_widget.dart';

class AppRestaurantWidget extends StatelessWidget {
  const AppRestaurantWidget({
    super.key,
    required this.restaurant,
    required this.withBackground,
    this.isExpanded = false,
  });

  final Restaurant restaurant;
  final bool withBackground;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (restaurant.restaurantStatus == 1) {
          Get.toNamed(
            RouteHelper.getRestaurantRoute(restaurant.id),
            arguments: RestaurantScreen(restaurant: restaurant),
          );
        } else if (restaurant.restaurantStatus == 0) {
          showCustomSnackBar('restaurant_is_not_available'.tr);
        }
      },
      child: Container(
        padding: EdgeInsets.all(withBackground ? 10 : 0),
        margin: !isExpanded ? const EdgeInsets.only(right: 10) : null,
        width: isExpanded
            ? Dimensions.webMaxWidth
            : MediaQuery.sizeOf(context).width * .75,
        decoration: BoxDecoration(
          color: withBackground ? Theme.of(context).cardColor : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(isExpanded
                  ? 8
                  : withBackground
                      ? 13
                      : 20),
              child: AspectRatio(
                aspectRatio: 2644 / 1078,
                child: CustomImageWidget(
                  image: restaurant.fullCover,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: isExpanded ? 200 : 150,
                  isRestaurant: true,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: CustomImageWidget(
                              image:
                                  '${Get.find<SplashController>().configModel!.baseUrls!.restaurantImageUrl}/${restaurant.logo}',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              restaurant.name ?? '',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GetBuilder<FavouriteController>(
                              builder: (favoriteController) {
                            bool isWished = favoriteController.wishRestIdList
                                .contains(restaurant.id);
                            return CustomFavouriteWidget(
                              isWished: isWished,
                              isRestaurant: true,
                              restaurant: restaurant,
                            );
                          }),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          IconWithTextRowWidget(
                            icon: Icons.star,
                            text: restaurant.avgRating!.toStringAsFixed(1),
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                            isMobile: true,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color,
                          ),
                          const DotWidget(),
                          Text(
                            '${restaurant.distanceInMile.toStringAsFixed(1)} ${'km'.tr}',
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                          ),
                          const DotWidget(),
                          Text(
                            restaurant.deliveryTimeFormatted,
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ' \$${restaurant.deliveryAmount.toStringAsFixed(1)} delivery fee',
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.titleMedium!.color,
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
