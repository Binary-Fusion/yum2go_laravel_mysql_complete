import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yum2go_v3_customer/common/widgets/custom_image_widget.dart';
import 'package:yum2go_v3_customer/features/category/controllers/category_controller.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

import '../../../../helper/route_helper.dart';
import '../../../splash/controllers/splash_controller.dart';

class AppCategoryListWidget extends StatelessWidget {
  const AppCategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const height = 100.0;
    final categoryBaseUrl =
        Get.find<SplashController>().configModel!.baseUrls!.categoryImageUrl;
    return SizedBox(
      height: height,
      child: GetBuilder<CategoryController>(
        init: Get.find<CategoryController>()..getCategoryList(false),
        builder: (controller) {
          return Skeletonizer(
            enabled: controller.categoryList == null,
            child: ListView.builder(
              itemCount: controller.categoryList?.length ?? 7,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: Dimensions.paddingSizeSmall,
                right: Dimensions.paddingSizeSmall,
                top: Dimensions.paddingSizeDefault,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(RouteHelper.getCategoryProductRoute(
                      controller.categoryList![index].id,
                      controller.categoryList![index].name!,
                    ));
                  },
                  child: SizedBox(
                    height: height,
                    width: 70,
                    child: Column(
                      children: [
                        ClipOval(
                          child: CustomImageWidget(
                            image:
                                "$categoryBaseUrl/${controller.categoryList?[index].image ?? ''}",
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          controller.categoryList?[index].name ?? 'category',
                          textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
