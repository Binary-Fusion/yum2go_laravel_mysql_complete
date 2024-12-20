import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/common/widgets/footer_view_widget.dart';
import 'package:yum2go_v3_customer/features/auth/controllers/auth_controller.dart';
import 'package:yum2go_v3_customer/features/home/controllers/home_controller.dart';
import 'package:yum2go_v3_customer/features/home/widgets/all_restaurant_filter_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/all_restaurants_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/popular_restaurants_view_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/what_on_your_mind_view_widget.dart';
import 'package:yum2go_v3_customer/features/splash/controllers/splash_controller.dart';
import 'package:yum2go_v3_customer/features/splash/domain/models/config_model.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';

class WebHomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  const WebHomeScreen({super.key, required this.scrollController});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  ConfigModel? _configModel;

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().setCurrentIndex(0, false);
    _configModel = Get.find<SplashController>().configModel;
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = Get.find<AuthController>().isLoggedIn();

    return CustomScrollView(
      controller: widget.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
                width: Dimensions.webMaxWidth,
                child: WhatOnYourMindViewWidget()),
          ),
        ),
        // SliverToBoxAdapter(
        //     child: GetBuilder<HomeController>(builder: (bannerController) {
        //   return bannerController.bannerImageList == null
        //       ? WebBannerViewWidget(homeController: bannerController)
        //       : bannerController.bannerImageList!.isEmpty
        //           ? const SizedBox()
        //           : WebBannerViewWidget(homeController: bannerController);
        // })),
        const SliverToBoxAdapter(
            child: Center(
                child: SizedBox(
          width: Dimensions.webMaxWidth,
          child: Column(children: [
            // const BadWeatherWidget(),

            // const TodayTrendsViewWidget(),

            // isLogin ? const OrderAgainViewWidget() : const SizedBox(),

            // _configModel!.popularFood == 1
            //     ? const BestReviewItemViewWidget(isPopular: false)
            //     : const SizedBox(),

            // const WebCuisineViewWidget(),

            // const PopularRestaurantsViewWidget(),

            // const PopularFoodNearbyViewWidget(),

            // isLogin
            //     ? const PopularRestaurantsViewWidget(isRecentlyViewed: true)
            //     : const SizedBox(),

            PopularRestaurantsViewWidget(isNationalFavorite: true),

            // const WebLocationAndReferBannerViewWidget(),

            // _configModel!.newRestaurant == 1
            //     ? const WebNewOnStackFoodViewWidget(isLatest: true)
            //     : const SizedBox(),

            PopularRestaurantsViewWidget(isLocalFavorite: true),

            // const PromotionalBannerViewWidget(),

            SizedBox(width: Dimensions.paddingSizeExtraSmall),
          ]),
        ))),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverDelegate(
            child: const AllRestaurantFilterWidget(),
          ),
        ),
        SliverToBoxAdapter(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeLarge),
            FooterViewWidget(
              child: AllRestaurantsWidget(
                  scrollController: widget.scrollController),
            ),
          ],
        ))),
      ],
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 ||
        oldDelegate.minExtent != 50 ||
        child != oldDelegate.child;
  }
}
