import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/home/widgets/app/restaurant_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/arrow_icon_button_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/restaurants_card_widget.dart';
import 'package:yum2go_v3_customer/features/restaurant/controllers/restaurant_controller.dart';
import 'package:yum2go_v3_customer/features/restaurant/screens/restaurant_screen.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/helper/route_helper.dart';
import 'package:yum2go_v3_customer/util/app_constants.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

class NewOnStackFoodViewWidget extends StatelessWidget {
  final bool isLatest;
  const NewOnStackFoodViewWidget({super.key, required this.isLatest});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(builder: (restController) {
      return (restController.latestRestaurantList != null &&
              restController.latestRestaurantList!.isEmpty)
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ResponsiveHelper.isMobile(context)
                      ? Dimensions.paddingSizeDefault
                      : Dimensions.paddingSizeLarge),
              child: Container(
                width: Dimensions.webMaxWidth,
                height: (GetPlatform.isMobile && !kIsWeb) ? 340 : 210,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${'new_on'.tr} ${AppConstants.appName}',
                                style: robotoBold.copyWith(
                                    fontSize: (GetPlatform.isMobile && !kIsWeb)
                                        ? Dimensions.paddingSizeSmall * 2
                                        : Dimensions.fontSizeLarge,
                                    fontWeight: FontWeight.w600)),
                            ArrowIconButtonWidget(
                              onTap: () => Get.toNamed(
                                  RouteHelper.getAllRestaurantRoute(
                                      isLatest ? 'latest' : '')),
                            ),
                          ]),
                    ),
                    restController.latestRestaurantList != null
                        ? SizedBox(
                            height:
                                (GetPlatform.isMobile && !kIsWeb) ? 255 : 135,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(
                                  right: Dimensions.paddingSizeDefault),
                              itemCount:
                                  restController.latestRestaurantList!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.paddingSizeDefault),
                                  child: (GetPlatform.isMobile && !kIsWeb)
                                      ? AppRestaurantWidget(
                                          restaurant: restController
                                              .latestRestaurantList![index],
                                          withBackground: true,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                              RouteHelper.getRestaurantRoute(
                                                  restController
                                                      .latestRestaurantList![
                                                          index]
                                                      .id),
                                              arguments: RestaurantScreen(
                                                  restaurant: restController
                                                          .latestRestaurantList![
                                                      index]),
                                            );
                                          },
                                          child: RestaurantsCardWidget(
                                            isNewOnStackFood: true,
                                            restaurant: restController
                                                .latestRestaurantList![index],
                                          ),
                                        ),
                                );
                              },
                            ),
                          )
                        : const RestaurantsCardShimmer(isNewOnStackFood: false),
                  ],
                ),
              ),
            );
    });
  }
}
