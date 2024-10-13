// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/auth/controllers/auth_controller.dart';
import 'package:yum2go_v3_customer/helper/route_helper.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../helper/address_helper.dart';
import '../../../../helper/auth_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../cart/controllers/cart_controller.dart';
import '../../../location/controllers/location_controller.dart';
import '../../../notification/controllers/notification_controller.dart';

class PhoneAppbarWidget extends SliverAppBar {
  PhoneAppbarWidget({super.key})
      : super(
          actions: [
            GetBuilder<AuthController>(builder: (controller) {
              return IconWithIndicator(
                icon: Assets.icons.profile.path,
                onTap: () {
                  if (controller.isLoggedIn()) {
                    Get.toNamed(RouteHelper.getProfileRoute());
                  } else {
                    Get.toNamed(RouteHelper.getSignInRoute('/'));
                  }
                },
                number: 0,
              );
            }),
            GetBuilder<NotificationController>(builder: (controller) {
              return IconWithIndicator(
                icon: Assets.icons.bell.path,
                onTap: () {
                  Get.toNamed(RouteHelper.getNotificationRoute());
                },
                number: controller.notificationList?.length ?? 0,
              );
            }),
            GetBuilder<CartController>(builder: (controller) {
              return IconWithIndicator(
                icon: Assets.icons.shoppingCart.path,
                onTap: () {
                  Get.toNamed(RouteHelper.getCartRoute());
                },
                number: controller.cartList.length,
              );
            }),
            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          ],
          leading: null,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const AddressBar(),
          pinned: true,
          centerTitle: false,
          surfaceTintColor: Get.theme.cardColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Handle the search box tap here
                        Get.toNamed(RouteHelper.getSearchRoute());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 18),
                        height: 40.0, // Set the height to match the image
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          // border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(CupertinoIcons.search,
                                  color: Colors.grey),
                            ),
                            Text(
                              'Search YUM2GO',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.getMapViewRoute());
                    },
                    child: Container(
                      height: 40.0, // Set the height to match the image
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.map),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}

class AddressBar extends StatelessWidget {
  const AddressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: constraints,
        child: InkWell(
          onTap: () => Get.toNamed(RouteHelper.getAccessLocationRoute('home')),
          child: GetBuilder<LocationController>(
            builder: (locationController) {
              return Row(
                children: [
                  AuthHelper.isLoggedIn()
                      ? Icon(
                          AddressHelper.getAddressFromSharedPref()!
                                      .addressType ==
                                  'home'
                              ? Icons.home_filled
                              : AddressHelper.getAddressFromSharedPref()!
                                          .addressType ==
                                      'office'
                                  ? Icons.work
                                  : Icons.location_on,
                          size: 20,
                          color: Theme.of(context).textTheme.titleMedium!.color,
                        )
                      : Icon(
                          Icons.location_on,
                          size: 20,
                          color: Theme.of(context).textTheme.titleMedium!.color,
                        ),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (AddressHelper.getAddressFromSharedPref()?.address !=
                            null) ...[
                          Text(
                            'your_location'.tr,
                            style: robotoRegular.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color,
                              fontSize: Dimensions.fontSizeSmall,
                              height: .7,
                            ),
                          ),
                          const SizedBox(
                              height: Dimensions.paddingSizeExtraSmall),
                        ],
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                AddressHelper.getAddressFromSharedPref()
                                        ?.address ??
                                    'your_location'.tr,
                                style: robotoBold.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color,
                                  fontSize: Dimensions.fontSizeDefault,
                                  height: .7,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

class IconWithIndicator extends StatelessWidget {
  const IconWithIndicator({
    super.key,
    required this.icon,
    required this.number,
    required this.onTap,
  });

  final String icon;
  final int number;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const iconSize = 24.0;
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Image.asset(icon, width: iconSize, height: iconSize),
          onPressed: onTap,
          padding: const EdgeInsets.only(right: 10.0),
          visualDensity: VisualDensity.compact,
          iconSize: 12,
        ),
        if (number > 0)
          Positioned(
            right: 8,
            top: 3,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
