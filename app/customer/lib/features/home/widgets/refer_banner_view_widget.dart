import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/language/controllers/localization_controller.dart';
import 'package:yum2go_v3_customer/features/splash/controllers/splash_controller.dart';
import 'package:yum2go_v3_customer/helper/price_converter.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/images.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

import '../../../helper/route_helper.dart';

class ReferBannerViewWidget extends StatelessWidget {
  final bool fromTheme1;
  const ReferBannerViewWidget({super.key, this.fromTheme1 = false});

  @override
  Widget build(BuildContext context) {
    double rightValue = (MediaQuery.of(context).size.width * 0.7);
    return (Get.find<SplashController>().configModel!.refEarningStatus == 1)
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.isMobile(context)
                  ? fromTheme1
                      ? Dimensions.paddingSizeSmall
                      : Dimensions.paddingSizeDefault
                  : 0,
              vertical: ResponsiveHelper.isMobile(context)
                  ? Dimensions.paddingSizeDefault
                  : Dimensions.paddingSizeLarge,
            ),
            child: InkWell(
              onTap: () => Get.toNamed(
                RouteHelper.getReferAndEarnRoute(),
              ),
              child: Container(
                // padding: EdgeInsets.all(ResponsiveHelper.isMobile(context)
                //     ? 0
                //     : Dimensions.paddingSizeLarge),
                // height: ResponsiveHelper.isMobile(context) ? 95 : 147,
                decoration: !(GetPlatform.isMobile && !kIsWeb)
                    ? null
                    : BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.tertiaryContainer,
                              Theme.of(context).colorScheme.tertiary,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                child: Stack(
                  children: [
                    Positioned(
                      right: Get.find<LocalizationController>().isLtr
                          ? null
                          : -rightValue,
                      child: Image.asset(
                        Images.referBg,
                        // height: ResponsiveHelper.isMobile(context) ? 95 : 147,
                        width: Dimensions.webMaxWidth,
                      ),
                    ),
                    Container(
                      width: (ResponsiveHelper.isMobile(context)
                              ? MediaQuery.sizeOf(context).width
                              : Dimensions.webMaxWidth) *
                          .6,
                      padding: const EdgeInsets.fromLTRB(22, 29, 0, 0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${'earn'.tr} ',
                              style: robotoMedium.copyWith(
                                  fontSize: ResponsiveHelper.isMobile(context)
                                      ? Dimensions.fontSizeLarge
                                      : Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: PriceConverter.convertPrice(
                                  Get.find<SplashController>()
                                      .configModel!
                                      .refEarningExchangeRate),
                              style: robotoBold.copyWith(
                                  fontSize: ResponsiveHelper.isMobile(context)
                                      ? Dimensions.fontSizeLarge
                                      : Dimensions.fontSizeOverLarge,
                                  height: 1.4,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: ' ${'when_you'.tr} ',
                              style: robotoMedium.copyWith(
                                  fontSize: ResponsiveHelper.isMobile(context)
                                      ? Dimensions.fontSizeLarge
                                      : Dimensions.fontSizeLarge,
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: 'refer_an_friend'.tr.toLowerCase(),
                              style: robotoRegular.copyWith(
                                  fontSize: ResponsiveHelper.isMobile(context)
                                      ? Dimensions.fontSizeLarge
                                      : Dimensions.fontSizeDefault,
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     CustomButtonWidget(
                    //         buttonText: 'refer_now'.tr,
                    //         width:
                    //             ResponsiveHelper.isMobile(context) ? 90 : 120,
                    //         height:
                    //             ResponsiveHelper.isMobile(context) ? 35 : 40,
                    //         isBold: true,
                    //         fontSize: Dimensions.fontSizeSmall,
                    //         textColor: Theme.of(context).primaryColor,
                    //         radius: Dimensions.radiusSmall,
                    //         color: Theme.of(context).cardColor,
                    //         onPressed: () => Get.toNamed(
                    //             RouteHelper.getReferAndEarnRoute())),
                    //   ],
                    // ),
                    SizedBox(
                        width: ResponsiveHelper.isMobile(context)
                            ? Dimensions.paddingSizeSmall
                            : 0),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
