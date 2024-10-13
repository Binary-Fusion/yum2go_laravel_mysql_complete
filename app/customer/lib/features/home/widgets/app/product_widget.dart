// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/common/widgets/custom_snackbar_widget.dart';

import '../../../../common/widgets/custom_favourite_widget.dart';
import '../../../../common/widgets/custom_image_widget.dart';
import '../../../../common/widgets/product_bottom_sheet_widget.dart';
import '../../../../helper/modal_sheet/wolt_modal_sheet_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../favourite/controllers/favourite_controller.dart';
import '../../../splash/controllers/splash_controller.dart';
import '../icon_with_text_row_widget.dart';

class AppProductWidget extends StatelessWidget {
  const AppProductWidget({
    super.key,
    required this.product,
    required this.withBackground,
    this.isExpanded = false,
  });

  final Product product;
  final bool withBackground;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product.restaurantStatus == 1) {
          showWoltModalSheet(context, (modalSheetContext) {
            return ProductBottomSheetWidget.getWoltSheet(
              modalSheetContext,
              product: product,
              inRestaurantPage: false,
              isCampaign: false,
            );
          });
        } else {
          showCustomSnackBar('item_is_not_available'.tr);
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
              borderRadius: BorderRadius.circular(
                isExpanded
                    ? 8
                    : withBackground
                        ? 13
                        : 20,
              ),
              child: AspectRatio(
                aspectRatio: 2644 / 1078,
                child: CustomImageWidget(
                  image:
                      '${Get.find<SplashController>().configModel!.baseUrls!.restaurantImageUrl}/${product.image}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: isExpanded ? 200 : 150,
                  isFood: true,
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
                          // ClipOval(
                          //   child: CustomImageWidget(
                          //     image:
                          //         '${Get.find<SplashController>().configModel!.baseUrls!.restaurantImageUrl}/${product.res}',
                          //     width: 20,
                          //     height: 20,
                          //   ),
                          // ),
                          // const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              product.name ?? '',
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
                            bool isWished = favoriteController.wishProductIdList
                                .contains(product.id);
                            return CustomFavouriteWidget(
                              isWished: isWished,
                              isRestaurant: false,
                              product: product,
                            );
                          }),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          IconWithTextRowWidget(
                            icon: Icons.star,
                            text: product.avgRating!.toStringAsFixed(1),
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                            isMobile: true,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color,
                          ),
                          // const DotWidget(),
                          // Text(
                          //   '${product.distanceInMile.toStringAsFixed(1)} ${'km'.tr}',
                          //   style: robotoRegular.copyWith(
                          //     fontSize: Dimensions.fontSizeSmall,
                          //   ),
                          // ),
                          // const DotWidget(),
                          // Text(
                          //   product.deliveryTimeFormatted,
                          //   style: robotoRegular.copyWith(
                          //     fontSize: Dimensions.fontSizeSmall,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price?.toStringAsFixed(1) ?? '0.0'}',
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          fontWeight: FontWeight.bold,
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
