import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/home/widgets/filter_view_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/restaurant_filter_button_widget.dart';
import 'package:yum2go_v3_customer/features/restaurant/controllers/restaurant_controller.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

class AllRestaurantFilterWidget extends StatelessWidget {
  const AllRestaurantFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(builder: (restaurantController) {
      return Center(
        child: ResponsiveHelper.isDesktop(context)
            ? Container(
                height: 70,
                width: Dimensions.webMaxWidth,
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('all_restaurants'.tr,
                              style: robotoBold.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            '${restaurantController.restaurantModel != null ? restaurantController.totalCount : 0} ${'restaurants_near_you'.tr}',
                            style: robotoRegular.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                        ]),
                    const Expanded(child: SizedBox()),
                    filter(context, restaurantController),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                  ],
                ))
            : Container(
                transform: Matrix4.translationValues(0, -2, 0),
                color: (GetPlatform.isMobile && !kIsWeb)
                    ? Theme.of(context).cardColor
                    : Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault,
                    vertical: Dimensions.paddingSizeExtraSmall),
                child: Column(children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('all_restaurants'.tr,
                            style: robotoBold.copyWith(
                                fontSize: (GetPlatform.isMobile && !kIsWeb)
                                    ? Dimensions.paddingSizeSmall * 2
                                    : Dimensions.fontSizeLarge)),
                        Flexible(
                          child: Text(
                            '${restaurantController.restaurantModel != null ? restaurantController.totalCount : 0} ${'restaurants_near_you'.tr}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: robotoRegular.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                        ),
                      ]),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  filter(context, restaurantController),
                ]),
              ),
      );
    });
  }

  Widget filter(
      BuildContext context, RestaurantController restaurantController) {
    return SizedBox(
      height: ResponsiveHelper.isDesktop(context) ? 40 : 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          ResponsiveHelper.isDesktop(context)
              ? const SizedBox()
              : const FilterViewWidget(),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          RestaurantsFilterButtonWidget(
            buttonText: 'top_rated'.tr,
            onTap: () => restaurantController.setTopRated(),
            isSelected: restaurantController.topRated == 1,
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          RestaurantsFilterButtonWidget(
            buttonText: 'discounted'.tr,
            onTap: () => restaurantController.setDiscount(),
            isSelected: restaurantController.discount == 1,
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          RestaurantsFilterButtonWidget(
            buttonText: 'veg'.tr,
            onTap: () => restaurantController.setVeg(),
            isSelected: restaurantController.veg == 1,
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          RestaurantsFilterButtonWidget(
            buttonText: 'non_veg'.tr,
            onTap: () => restaurantController.setNonVeg(),
            isSelected: restaurantController.nonVeg == 1,
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          ResponsiveHelper.isDesktop(context)
              ? const FilterViewWidget()
              : const SizedBox(),
        ],
      ),
    );
  }
}
