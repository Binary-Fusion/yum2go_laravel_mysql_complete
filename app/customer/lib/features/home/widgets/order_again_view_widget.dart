import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/home/widgets/app/restaurant_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/arrow_icon_button_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/restaurants_card_widget.dart';
import 'package:yum2go_v3_customer/features/language/controllers/localization_controller.dart';
import 'package:yum2go_v3_customer/features/restaurant/controllers/restaurant_controller.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/helper/route_helper.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

class OrderAgainViewWidget extends StatelessWidget {
  const OrderAgainViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(builder: (restController) {
      return (restController.orderAgainRestaurantList != null &&
              restController.orderAgainRestaurantList!.isNotEmpty)
          ? Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ResponsiveHelper.isMobile(context)
                      // ? Dimensions.paddingSizeExtraSmall
                      ? 0
                      : Dimensions.paddingSizeLarge),
              child: SizedBox(
                height: ResponsiveHelper.isDesktop(context)
                    ? 236
                    : (GetPlatform.isMobile && !kIsWeb)
                        ? 300
                        : 225,
                width: Dimensions.webMaxWidth,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.isMobile(context)
                                ? Dimensions.paddingSizeDefault
                                : 0),
                        child: Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  ResponsiveHelper.isMobile(context)
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.center,
                              children: [
                                Text('order_again'.tr,
                                    style: robotoBold.copyWith(
                                        fontSize:
                                            ResponsiveHelper.isMobile(context)
                                                ? Dimensions.paddingSizeSmall *
                                                    2
                                                : Dimensions.fontSizeLarge,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                    '${'recently_you_ordered_from'.tr} ${restController.orderAgainRestaurantList!.length} ${'restaurants'.tr}',
                                    style: robotoRegular.copyWith(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: Dimensions.fontSizeSmall)),
                              ],
                            ),
                          ),
                          ArrowIconButtonWidget(
                            onTap: () => Get.toNamed(
                                RouteHelper.getAllRestaurantRoute(
                                    'order_again')),
                          ),
                        ]),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      SizedBox(
                        height: ResponsiveHelper.isDesktop(context)
                            ? 155
                            : (GetPlatform.isMobile && !kIsWeb)
                                ? 230
                                : 150,
                        child: ListView.builder(
                          itemCount:
                              restController.orderAgainRestaurantList!.length,
                          padding: EdgeInsets.only(
                              right: ResponsiveHelper.isMobile(context)
                                  ? Dimensions.paddingSizeDefault
                                  : 0),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: (ResponsiveHelper.isDesktop(context) &&
                                          index == 0 &&
                                          Get.find<LocalizationController>()
                                              .isLtr)
                                      ? 0
                                      : Dimensions.paddingSizeDefault),
                              child: (GetPlatform.isMobile && !kIsWeb)
                                  ? AppRestaurantWidget(
                                      restaurant: restController
                                          .orderAgainRestaurantList![index],
                                      withBackground: false,
                                    )
                                  : RestaurantsCardWidget(
                                      isNewOnStackFood: false,
                                      restaurant: restController
                                          .orderAgainRestaurantList![index],
                                    ),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
            )
          : const SizedBox();
    });
  }
}
