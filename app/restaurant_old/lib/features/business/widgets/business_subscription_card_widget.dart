import 'package:stackfood_multivendor_restaurant/features/business/controllers/business_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/business/domain/models/package_model.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/card_paint_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/curve_clipper_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/package_widget.dart';
import 'package:stackfood_multivendor_restaurant/helper/price_converter_helper.dart';
import 'package:stackfood_multivendor_restaurant/util/dimensions.dart';
import 'package:stackfood_multivendor_restaurant/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessSubscriptionCardWidget extends StatelessWidget {
  final int index;
  final Packages package;
  final BusinessController businessController;
  final Color color;
  final String? content;
  const BusinessSubscriptionCardWidget({super.key, required this.index, required this.package, required this.businessController, required this.color, this.content});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

      ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(Dimensions.radiusLarge), topRight: Radius.circular(Dimensions.radiusLarge)),
        child: Stack(children: [

          ClipPath(
            clipper: CurveClipperWidget(),
            child: Container(
            color: color.withOpacity(0.3),
            height: 140.0,
            ),
          ),

          ClipPath(
            clipper: CurveClipperWidget(),
            child: Container(
              color: color.withOpacity(0.2),
              height: 160.0,
            ),
          ),

          ClipPath(
            clipper: CurveClipperWidget(),
            child: Stack(children: [

              SizedBox(
                height: 120, width: size.width,
                child: Container(
                  color: color.withOpacity(1),
                  height: 120.0,
                ),
              ),

              Positioned(
                child: SizedBox(
                  height: 120, width: size.width,
                  child: CustomPaint(
                    painter: const CardPaintWidget(color: Colors.white),
                    child: Center(
                      child: Text(
                        '${package.packageName}',
                        style: robotoBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: Theme.of(context).cardColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),

            ]),
          ),

        ]),
      ),
      const SizedBox(height: Dimensions.paddingSizeDefault),

      Text(
        PriceConverter.convertPrice(package.price), textDirection: TextDirection.ltr,
        style: robotoBold.copyWith(fontSize: 35, color: color),
      ),

      Text('${package.validity} ' 'days'.tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall)),
      const SizedBox(height: Dimensions.paddingSizeDefault),

      Divider(color: color, indent: 70, endIndent: 70, thickness: 2),
      const SizedBox(height: Dimensions.paddingSizeDefault),

      content == null ? Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

        PackageWidget(title: '${'max_order'.tr} (${package.maxOrder})'),

        PackageWidget(title: '${'max_product'.tr} (${package.maxProduct})'),

        package.pos != 0 ? PackageWidget(title: 'pos'.tr) : const SizedBox(),

        package.mobileApp != 0 ? PackageWidget(title: 'mobile_app_access'.tr) : const SizedBox(),

        package.chat != 0 ? PackageWidget(title: 'chat'.tr) : const SizedBox(),

        package.review != 0 ? PackageWidget(title: 'review'.tr) : const SizedBox(),

        package.selfDelivery != 0 ? PackageWidget(title: 'self_delivery'.tr) : const SizedBox(),

      ]) : Text(
          content!,
          style: robotoRegular,
          textAlign: TextAlign.center,
          textScaler:
          const TextScaler.linear(
          1.1),
          ),
    ]);
  }
}