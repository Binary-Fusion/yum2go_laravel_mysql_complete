import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/home/widgets/location_banner_view_widget.dart';
import 'package:yum2go_v3_customer/features/home/widgets/refer_banner_view_widget.dart';
import 'package:yum2go_v3_customer/features/splash/controllers/splash_controller.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';

class WebLocationAndReferBannerViewWidget extends StatelessWidget {
  const WebLocationAndReferBannerViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.webMaxWidth,
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeLarge,
        horizontal: 13,
      ),
      child: Row(
        children: [
          const Expanded(
            child: LocationBannerViewWidget(),
          ),
          if (Get.find<SplashController>().configModel!.refEarningStatus ==
              1) ...[
            const SizedBox(width: Dimensions.paddingSizeLarge),
            const Expanded(
              child: ReferBannerViewWidget(),
            )
          ],
        ],
      ),
    );
  }
}
