import 'package:yum2go_v3_customer/common/widgets/custom_ink_well_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/arrow_icon_button_widget.dart';
import 'package:yum2go_v3_customer/features/language/controllers/localization_controller.dart';
import 'package:yum2go_v3_customer/features/splash/controllers/splash_controller.dart';
import 'package:yum2go_v3_customer/features/category/controllers/category_controller.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/helper/route_helper.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/styles.dart';
import 'package:yum2go_v3_customer/common/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class WhatOnYourMindViewWidget extends StatelessWidget {
  const WhatOnYourMindViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (categoryController) {
      final maxItems = ResponsiveHelper.isDesktop(context) ? 15 : 10;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveHelper.isMobile(context)
                ? Dimensions.paddingSizeLarge
                : Dimensions.paddingSizeOverLarge,
            left: Get.find<LocalizationController>().isLtr
                ? Dimensions.paddingSizeExtraSmall
                : 0,
            right: Get.find<LocalizationController>().isLtr
                ? 0
                : Dimensions.paddingSizeExtraSmall,
            bottom: ResponsiveHelper.isMobile(context)
                ? Dimensions.paddingSizeDefault
                : Dimensions.paddingSizeOverLarge,
          ),
          child: ResponsiveHelper.isDesktop(context)
              ? Text('what_on_your_mind'.tr,
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeLarge,
                      fontWeight: FontWeight.w600))
              : Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.paddingSizeSmall,
                      right: Dimensions.paddingSizeDefault),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('what_on_your_mind'.tr,
                          style: robotoBold.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              fontWeight: FontWeight.w600)),
                      ArrowIconButtonWidget(
                          onTap: () =>
                              Get.toNamed(RouteHelper.getCategoryRoute())),
                    ],
                  ),
                ),
        ),
        SizedBox(
          height: ResponsiveHelper.isMobile(context) ? 120 : 100,
          child: categoryController.categoryList != null
              ? ListView.builder(
                  physics: ResponsiveHelper.isMobile(context)
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                      left: Dimensions.paddingSizeDefault),
                  itemCount: categoryController.categoryList!.length > maxItems
                      ? maxItems
                      : categoryController.categoryList!.length,
                  itemBuilder: (context, index) {
                    if (index == (maxItems - 1)) {
                      return ResponsiveHelper.isDesktop(context)
                          ? Padding(
                              padding: EdgeInsets.only(
                                bottom: Dimensions.paddingSizeSmall,
                                top: ResponsiveHelper.isMobile(context)
                                    ? Dimensions.paddingSizeSmall
                                    : Dimensions.paddingSizeExtraSmall,
                              ),
                              child: Container(
                                width: ResponsiveHelper.isMobile(context)
                                    ? 70
                                    : 60,
                                padding: EdgeInsets.only(
                                    left: Dimensions.paddingSizeExtraSmall,
                                    right: Dimensions.paddingSizeExtraSmall,
                                    top: ResponsiveHelper.isMobile(context)
                                        ? Dimensions.paddingSizeSmall
                                        : Dimensions.paddingSizeExtraSmall,
                                    bottom: Dimensions.paddingSizeSmall),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    hoverColor: Colors.transparent,
                                    onTap: () => Get.toNamed(
                                        RouteHelper.getCategoryRoute()),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).cardColor,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.3)),
                                      ),
                                      child: Icon(Icons.arrow_forward,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: Dimensions.paddingSizeSmall,
                          right: Dimensions.paddingSizeDefault),
                      child: Container(
                        width: ResponsiveHelper.isMobile(context) ? 70 : 60,
                        height: ResponsiveHelper.isMobile(context) ? 70 : 60,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusSmall),
                        ),
                        child: CustomInkWellWidget(
                          onTap: () =>
                              Get.toNamed(RouteHelper.getCategoryProductRoute(
                            categoryController.categoryList![index].id,
                            categoryController.categoryList![index].name!,
                          )),
                          radius: Dimensions.radiusSmall,
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                child: CustomImageWidget(
                                  image:
                                      '${Get.find<SplashController>().configModel!.baseUrls!.categoryImageUrl}/${categoryController.categoryList![index].image}',
                                  height: ResponsiveHelper.isMobile(context)
                                      ? 70
                                      : 40,
                                  width: ResponsiveHelper.isMobile(context)
                                      ? 70
                                      : 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: ResponsiveHelper.isMobile(context)
                                    ? Dimensions.paddingSizeDefault
                                    : Dimensions.paddingSizeLarge),
                            Expanded(
                                child: Text(
                              categoryController.categoryList![index].name!,
                              style: robotoMedium.copyWith(
                                fontSize: ResponsiveHelper.isMobile(context)
                                    ? Dimensions.fontSizeSmall
                                    : Dimensions.fontSizeExtraSmall,
                              ),
                              maxLines:
                                  ResponsiveHelper.isMobile(context) ? 1 : 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            )),
                          ]),
                        ),
                      ),
                    );
                  },
                )
              : WebWhatOnYourMindViewShimmer(
                  categoryController: categoryController),
        ),
        const SizedBox(height: Dimensions.paddingSizeLarge),
      ]);
    });
  }
}

class WebWhatOnYourMindViewShimmer extends StatelessWidget {
  final CategoryController categoryController;
  const WebWhatOnYourMindViewShimmer(
      {super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    final maxItems = ResponsiveHelper.isDesktop(context) ? 15 : 10;
    return SizedBox(
      height: ResponsiveHelper.isMobile(context) ? 120 : 100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: maxItems,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: Dimensions.paddingSizeSmall,
              right: Dimensions.paddingSizeSmall,
              top: ResponsiveHelper.isMobile(context)
                  ? Dimensions.paddingSizeSmall
                  : Dimensions.paddingSizeExtraSmall,
            ),
            child: Container(
              width: ResponsiveHelper.isMobile(context) ? 70 : 60,
              height: ResponsiveHelper.isMobile(context) ? 70 : 60,
              padding: EdgeInsets.only(
                left: Dimensions.paddingSizeExtraSmall,
                right: Dimensions.paddingSizeExtraSmall,
                top: ResponsiveHelper.isMobile(context)
                    ? Dimensions.paddingSizeSmall
                    : Dimensions.paddingSizeExtraSmall,
                bottom: Dimensions.paddingSizeExtraSmall,
              ),
              margin: EdgeInsets.only(
                top: ResponsiveHelper.isMobile(context)
                    ? 0
                    : Dimensions.paddingSizeExtraSmall,
              ),
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: Shimmer(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusSmall),
                          color: Theme.of(context).shadowColor),
                      height: ResponsiveHelper.isMobile(context) ? 70 : 40,
                      width: ResponsiveHelper.isMobile(context) ? 70 : 40,
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  child: Shimmer(
                    child: Container(
                      height: ResponsiveHelper.isMobile(context) ? 10 : 15,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusSmall),
                          color: Theme.of(context).shadowColor),
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
