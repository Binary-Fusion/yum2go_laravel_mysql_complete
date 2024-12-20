import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/common/widgets/custom_app_bar_widget.dart';
import 'package:yum2go_v3_customer/common/widgets/footer_view_widget.dart';
import 'package:yum2go_v3_customer/common/widgets/menu_drawer_widget.dart';
import 'package:yum2go_v3_customer/common/widgets/product_view_widget.dart';
import 'package:yum2go_v3_customer/common/widgets/web_page_title_widget.dart';
import 'package:yum2go_v3_customer/features/restaurant/controllers/restaurant_controller.dart';
import 'package:yum2go_v3_customer/util/app_constants.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';

class AllRestaurantScreen extends StatefulWidget {
  final bool isPopular;
  final bool isRecentlyViewed;
  final bool isOrderAgain;
  final bool isNational;
  final bool isLocal;
  const AllRestaurantScreen(
      {super.key,
      required this.isPopular,
      required this.isRecentlyViewed,
      required this.isNational,
      required this.isLocal,
      required this.isOrderAgain});

  @override
  State<AllRestaurantScreen> createState() => _AllRestaurantScreenState();
}

class _AllRestaurantScreenState extends State<AllRestaurantScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    if (widget.isPopular) {
      Get.find<RestaurantController>()
          .getPopularRestaurantList(false, 'all', false);
    } else if (widget.isRecentlyViewed) {
      Get.find<RestaurantController>()
          .getRecentlyViewedRestaurantList(false, 'all', false);
    } else if (widget.isNational) {
      Get.find<RestaurantController>()
          .getNationalRestaurantList(false, 'all', false);
    } else if (widget.isLocal) {
      Get.find<RestaurantController>()
          .getLocalRestaurantList(false, 'all', false);
    } else if (widget.isOrderAgain) {
      Get.find<RestaurantController>().getOrderAgainRestaurantList(false);
    } else {
      Get.find<RestaurantController>()
          .getLatestRestaurantList(false, 'all', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(builder: (restController) {
      return Scaffold(
        appBar: CustomAppBarWidget(
          hasElevation: false,
          title: widget.isPopular
              ? 'popular_restaurants'.tr
              : widget.isRecentlyViewed
                  ? 'recently_viewed_restaurants'.tr
                  : widget.isOrderAgain
                      ? 'order_again'.tr
                      : widget.isNational
                          ? 'National Favorites'
                          : widget.isLocal
                              ? 'Local Favorites'
                              : '${'new_on'.tr} ${AppConstants.appName}',
          type: restController.type,
          onVegFilterTap: widget.isOrderAgain
              ? null
              : (String type) {
                  if (widget.isPopular) {
                    restController.getPopularRestaurantList(true, type, true);
                  } else {
                    if (widget.isRecentlyViewed) {
                      restController.getRecentlyViewedRestaurantList(
                          true, type, true);
                    } else {
                      if (widget.isNational) {
                        restController.getNationalRestaurantList(
                            true, type, true);
                      } else {
                        if (widget.isLocal) {
                          restController.getLocalRestaurantList(
                              true, type, true);
                        } else {
                          restController.getLatestRestaurantList(
                              true, type, true);
                        }
                      }
                    }
                  }
                },
        ),
        endDrawer: const MenuDrawerWidget(),
        endDrawerEnableOpenDragGesture: false,
        body: RefreshIndicator(
          onRefresh: () async {
            if (widget.isPopular) {
              await Get.find<RestaurantController>().getPopularRestaurantList(
                true,
                Get.find<RestaurantController>().type,
                false,
              );
            } else if (widget.isRecentlyViewed) {
              Get.find<RestaurantController>().getRecentlyViewedRestaurantList(
                  true, Get.find<RestaurantController>().type, false);
            } else if (widget.isOrderAgain) {
              Get.find<RestaurantController>()
                  .getOrderAgainRestaurantList(false);
            } else if (widget.isNational) {
              Get.find<RestaurantController>().getNationalRestaurantList(
                  true, Get.find<RestaurantController>().type, false);
            } else if (widget.isLocal) {
              Get.find<RestaurantController>().getLocalRestaurantList(
                  true, Get.find<RestaurantController>().type, false);
            } else {
              await Get.find<RestaurantController>().getLatestRestaurantList(
                  true, Get.find<RestaurantController>().type, false);
            }
          },
          child: SingleChildScrollView(
              controller: scrollController,
              child: FooterViewWidget(
                child: Column(
                  children: [
                    WebScreenTitleWidget(title: 'restaurants'.tr),
                    Center(
                        child: SizedBox(
                      width: Dimensions.webMaxWidth,
                      child: ProductViewWidget(
                        isRestaurant: true,
                        products: null,
                        noDataText: 'no_restaurant_available'.tr,
                        restaurants: widget.isPopular
                            ? restController.popularRestaurantList
                            : widget.isRecentlyViewed
                                ? restController.recentlyViewedRestaurantList
                                : widget.isOrderAgain
                                    ? restController.orderAgainRestaurantList
                                    : widget.isNational
                                        ? restController.nationalRestaurantList
                                        : widget.isLocal
                                            ? restController.localRestaurantList
                                            : restController
                                                .latestRestaurantList,
                      ),
                    )),
                  ],
                ),
              )),
        ),
      );
    });
  }
}
