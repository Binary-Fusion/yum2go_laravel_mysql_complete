import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:yum2go_v3_customer/features/product/controllers/product_controller.dart';
import 'package:yum2go_v3_customer/helper/price_converter.dart';

import '../../helper/responsive_helper.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';
import '../models/product_model.dart';
import 'custom_snackbar_widget.dart';

class VariationBottomSheetWidget extends GetView<ProductController> {
  final Product product;

  final List<Variation> variations;

  final BuildContext modalSheetContext;
  const VariationBottomSheetWidget({
    super.key,
    required this.product,
    required this.variations,
    required this.modalSheetContext,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('variations length: ${variations.length}');
    return SizedBox(
      width: 550,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
          minHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        color: Theme.of(context).colorScheme.surface,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: variations.length,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: (variations.isNotEmpty) ? 240 : 0,
            left: 20,
            right: 20,
          ),
          itemBuilder: (context, index) {
            int selectedCount = 0;
            if (variations[index].required!) {
              final variationIndex = product.allVariations.indexWhere(
                  (variation) =>
                      variation.variationId == variations[index].variationId);
              for (var value in controller.selectedVariations[variationIndex]) {
                if (value == true) {
                  selectedCount++;
                }
              }
            }
            return VariationWidget(
              variation: variations[index],
              selectedCount: selectedCount,
              margin: index != variations.length - 1
                  ? Dimensions.paddingSizeDefault
                  : 0,
              index: index,
              product: product,
              modalSheetContext: modalSheetContext,
            );
          },
        ),
      ),
    );
  }

  static SliverWoltModalSheetPage getWoltSheet(
    BuildContext modalSheetContext, {
    required Product product,
    required List<Variation> variations,
    (int, Variation)? parentVariation,
  }) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      leadingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        icon: const Icon(Icons.arrow_back),
        onPressed: WoltModalSheet.of(modalSheetContext).popPage,
      ),
      stickyActionBar: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: GetBuilder<ProductController>(builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: Navigator.of(modalSheetContext).pop,
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(child: Text('Cancel')),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (!_validate(
                      product: product,
                      productController: controller,
                      variations: variations,
                    )) {
                      return;
                    }
                    if (parentVariation != null) {
                      Future(() {
                        final parentVariationIndex =
                            product.variationIndex(parentVariation.$2);
                        // .allVariations
                        //     .indexWhere((variation) =>
                        //         variation.variationId ==
                        //         parentVariation.$2.variationId);
                        controller.setCartVariationIndex(
                          parentVariationIndex,
                          parentVariation.$1,
                          product,
                          parentVariation.$2.multiSelect!,
                          true,
                        );
                        controller.setExistInCartForBottomSheet(
                            product, controller.selectedVariations);
                      });
                    }
                    WoltModalSheet.of(modalSheetContext).popPage();
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Center(child: Text('Save')),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      topBarTitle: Text(
        'Variations',
        style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge),
      ),
      isTopBarLayerAlwaysVisible: false,
      trailingNavBarWidget: IconButton(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: VariationBottomSheetWidget(
        product: product,
        variations: variations,
        modalSheetContext: modalSheetContext,
      ),
    );
  }

  static bool _validate({
    required Product? product,
    required ProductController productController,
    required List<Variation> variations,
  }) {
    for (int index = 0; index < variations.length; index++) {
      final rootIndex =
          productController.product!.variationIndex(variations[index]);
      if (!variations[index].multiSelect! &&
          variations[index].required! &&
          !productController.selectedVariations[rootIndex].contains(true)) {
        print(
            'rootIndex: $rootIndex, selectedVariations: ${productController.selectedVariations[rootIndex]}, variation: ${variations[index].name}');
        showCustomSnackBar(
            '${'choose_a_variation_from'.tr} ${variations[index].name}',
            showToaster: false);
        // productController.changeCanAddToCartProduct(false);
        return false;
      } else if (variations[index].multiSelect! &&
          (variations[index].required! ||
              productController.selectedVariations[rootIndex].contains(true)) &&
          variations[index].min! >
              productController.selectedVariationLength(
                  productController.selectedVariations, rootIndex)) {
        showCustomSnackBar(
            '${'you_need_to_select_minimum'.tr} ${variations[index].min} '
            '${'to_maximum'.tr} ${variations[index].max} ${'options_from'.tr} ${variations[index].name}',
            showToaster: false);
        // productController.changeCanAddToCartProduct(false);
        return false;
      }
    }
    return true;
  }
}

class VariationWidget extends GetView<ProductController> {
  final Variation variation;

  final int selectedCount;
  final double margin;
  final int index;
  final Product product;
  final BuildContext modalSheetContext;
  const VariationWidget({
    super.key,
    required this.variation,
    required this.selectedCount,
    required this.margin,
    required this.index,
    required this.product,
    required this.modalSheetContext,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.all(variation.required!
            ? (variation.multiSelect! ? variation.min! : 1) <= selectedCount
                ? Dimensions.paddingSizeSmall
                : Dimensions.paddingSizeSmall
            : 0),
        margin: EdgeInsets.only(
          bottom: margin,
        ),
        decoration: BoxDecoration(
            color: variation.required!
                ? (variation.multiSelect! ? variation.min! : 1) <= selectedCount
                    ? Theme.of(context).primaryColor.withOpacity(0.05)
                    : Theme.of(context).disabledColor.withOpacity(0.05)
                : Colors.transparent,
            border: Border.all(
                color: variation.required!
                    ? (variation.multiSelect! ? variation.min! : 1) <=
                            selectedCount
                        ? Theme.of(context).primaryColor.withOpacity(0.3)
                        : Theme.of(context).disabledColor.withOpacity(0.3)
                    : Colors.transparent,
                width: 1),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  variation.name!,
                  maxLines: 2,
                  style:
                      robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge),
                ),
              ),
              const SizedBox(width: Dimensions.paddingSizeExtraSmall),
              Container(
                decoration: BoxDecoration(
                  color: variation.required!
                      ? (variation.multiSelect! ? variation.min! : 1) >
                              selectedCount
                          ? Theme.of(context).colorScheme.error.withOpacity(0.1)
                          : Theme.of(context).primaryColor.withOpacity(0.1)
                      : Theme.of(context).disabledColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                ),
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                child: Text(
                  variation.required!
                      ? (variation.multiSelect! ? variation.min! : 1) <=
                              selectedCount
                          ? 'completed'.tr
                          : 'required'.tr
                      : 'optional'.tr,
                  style: robotoRegular.copyWith(
                    color: variation.required!
                        ? (variation.multiSelect! ? variation.min! : 1) <=
                                selectedCount
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.error
                        : Theme.of(context).hintColor,
                    fontSize: Dimensions.fontSizeSmall,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Row(children: [
            variation.multiSelect!
                ? Text(
                    '${'select_minimum'.tr} ${'${variation.min}'
                        ' ${'and_up_to'.tr} ${variation.max} ${'options'.tr}'}',
                    style: robotoMedium.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: Theme.of(context).disabledColor),
                  )
                : Text(
                    'select_one'.tr,
                    style: robotoMedium.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: Theme.of(context).primaryColor),
                  ),
          ]),
          SizedBox(
              height: variation.multiSelect!
                  ? Dimensions.paddingSizeExtraSmall
                  : 0),
          GetBuilder<ProductController>(builder: (controller) {
            final variationIndex =
                controller.product!.variationIndex(variation);
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.collapseVariation[variationIndex]
                  ? variation.variationValues!.length > 4
                      ? 5
                      : variation.variationValues!.length
                  : variation.variationValues!.length,
              itemBuilder: (context, i) {
                if (i == 4 && controller.collapseVariation[variationIndex]) {
                  return Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                    child: InkWell(
                      onTap: () =>
                          controller.showMoreSpecificSection(variationIndex),
                      child: Row(children: [
                        Icon(Icons.expand_more,
                            size: 18, color: Theme.of(context).primaryColor),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        Text(
                          '${'view'.tr} ${variation.variationValues!.length - 4} ${'more_option'.tr}',
                          style: robotoMedium.copyWith(
                              color: Theme.of(context).primaryColor),
                        ),
                      ]),
                    ),
                  );
                } else {
                  return GetBuilder<ProductController>(builder: (controller) {
                    final variationIndex =
                        controller.product!.variationIndex(variation);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ResponsiveHelper.isDesktop(context)
                              ? Dimensions.paddingSizeExtraSmall
                              : 0),
                      child: InkWell(
                        onTap: () {
                          if (variation.variationValues![i].child.isNotEmpty) {
                            WoltModalSheet.of(modalSheetContext).pushPage(
                              VariationBottomSheetWidget.getWoltSheet(
                                modalSheetContext,
                                product: product,
                                variations: variation.variationValues![i].child,
                                parentVariation: (i, variation),
                              ),
                            );
                            return;
                          }
                          controller.setCartVariationIndex(variationIndex, i,
                              product, variation.multiSelect!);
                          controller.setExistInCartForBottomSheet(
                              product, controller.selectedVariations);
                        },
                        child: Row(children: [
                          Flexible(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  variation.multiSelect!
                                      ? Checkbox(
                                          value: controller.selectedVariations[
                                              variationIndex][i],
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiusSmall)),
                                          onChanged: !(variation
                                                  .variationValues![i]
                                                  .canToggleCheckboxOrRadio(
                                                      controller.selectedVariations[
                                                                  variationIndex]
                                                              [i] ??
                                                          false))
                                              ? null
                                              : (bool? newValue) {
                                                  final variationIndex = product
                                                      .allVariations
                                                      .indexWhere((variation) =>
                                                          variation
                                                              .variationId ==
                                                          this
                                                              .variation
                                                              .variationId);

                                                  controller
                                                      .setCartVariationIndex(
                                                          variationIndex,
                                                          i,
                                                          product,
                                                          variation
                                                              .multiSelect!);
                                                  controller
                                                      .setExistInCartForBottomSheet(
                                                          product,
                                                          controller
                                                              .selectedVariations);
                                                },
                                          visualDensity: const VisualDensity(
                                              horizontal: -3, vertical: -3),
                                          side: BorderSide(
                                              width: 2,
                                              color:
                                                  Theme.of(context).hintColor),
                                        )
                                      : Radio(
                                          value: i,
                                          groupValue: controller
                                              .selectedVariations[
                                                  variationIndex]
                                              .indexOf(true),
                                          onChanged: !(variation
                                                  .variationValues![i]
                                                  .canToggleCheckboxOrRadio(
                                                      controller.selectedVariations[
                                                                  variationIndex]
                                                              [i] ??
                                                          false))
                                              ? null
                                              : (dynamic value) {
                                                  controller
                                                      .setCartVariationIndex(
                                                          variationIndex,
                                                          i,
                                                          product,
                                                          variation
                                                              .multiSelect!);
                                                  controller
                                                      .setExistInCartForBottomSheet(
                                                          product,
                                                          controller
                                                              .selectedVariations);
                                                },
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          toggleable: false,
                                          visualDensity: const VisualDensity(
                                              horizontal: -3, vertical: -3),
                                          fillColor: WidgetStateColor
                                              .resolveWith((states) =>
                                                  controller.selectedVariations[
                                                          variationIndex][i]!
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .disabledColor),
                                        ),
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        if (variation.variationValues![i].child
                                            .isNotEmpty) {
                                          WoltModalSheet.of(modalSheetContext)
                                              .pushPage(
                                            VariationBottomSheetWidget
                                                .getWoltSheet(
                                              modalSheetContext,
                                              product: product,
                                              variations: variation
                                                  .variationValues![i].child,
                                              parentVariation: (i, variation),
                                            ),
                                          );
                                        } else {
                                          if (variation.multiSelect!) {
                                            final variationIndex = product
                                                .allVariations
                                                .indexWhere((variation) =>
                                                    variation.variationId ==
                                                    this.variation.variationId);
                                            print(
                                                'variationIndex: $variationIndex');

                                            controller.setCartVariationIndex(
                                                variationIndex,
                                                i,
                                                product,
                                                variation.multiSelect!);
                                            controller
                                                .setExistInCartForBottomSheet(
                                                    product,
                                                    controller
                                                        .selectedVariations);
                                          } else {
                                            controller.setCartVariationIndex(
                                                variationIndex,
                                                i,
                                                product,
                                                variation.multiSelect!);
                                            controller
                                                .setExistInCartForBottomSheet(
                                                    product,
                                                    controller
                                                        .selectedVariations);
                                          }
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            variation.variationValues![i].level!
                                                .trim(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                controller.selectedVariations[
                                                        variationIndex][i]!
                                                    ? robotoMedium
                                                    : robotoRegular.copyWith(
                                                        color: Theme.of(context)
                                                            .hintColor),
                                          ),
                                          Flexible(
                                            child: (controller
                                                            .selectedVariations[
                                                        variationIndex][i]! &&
                                                    (controller.quantity ==
                                                        product
                                                            .allVariations[
                                                                variationIndex]
                                                            .variationValues![i]
                                                            .currentStock))
                                                ? Text(
                                                    ' (${'only'.tr} ${variation.variationValues![i].currentStock} ${'item_available'.tr})',
                                                    style: robotoRegular.copyWith(
                                                        color: Colors.blue,
                                                        fontSize: Dimensions
                                                            .fontSizeExtraSmall),
                                                  )
                                                : Text(
                                                    ' (${'out_of_stock'.tr})',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: (product
                                                                    .allVariations[
                                                                        variationIndex]
                                                                    .variationValues![
                                                                        i]
                                                                    .stockType !=
                                                                'unlimited' &&
                                                            product
                                                                    .allVariations[
                                                                        variationIndex]
                                                                    .variationValues![
                                                                        i]
                                                                    .currentStock !=
                                                                null &&
                                                            product
                                                                    .allVariations[
                                                                        variationIndex]
                                                                    .variationValues![
                                                                        i]
                                                                    .currentStock! <=
                                                                0)
                                                        ? robotoMedium.copyWith(
                                                            color:
                                                                Theme.of(context)
                                                                    .colorScheme
                                                                    .error,
                                                            fontSize: Dimensions
                                                                .fontSizeExtraSmall)
                                                        : robotoRegular.copyWith(
                                                            color: Colors
                                                                .transparent),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          // (price > priceWithDiscount) &&
                          //         (discountType == 'percent')
                          //     ? Text(
                          //         PriceConverter.convertPrice(product!
                          //             .variation
                          //             .variationValues![i]
                          //             .optionPrice),
                          //         maxLines: 1,
                          //         overflow: TextOverflow.ellipsis,
                          //         textDirection: TextDirection.ltr,
                          //         style: robotoRegular.copyWith(
                          //             fontSize: Dimensions.fontSizeExtraSmall,
                          //             color: Theme.of(context).disabledColor,
                          //             decoration: TextDecoration.lineThrough),
                          //       )
                          //     : const SizedBox(),
                          // SizedBox(
                          //     width: price > priceWithDiscount
                          //         ? Dimensions.paddingSizeExtraSmall
                          //         : 0),
                          Builder(builder: (context) {
                            final variationIndex = product.allVariations
                                .indexWhere((variation) =>
                                    variation.variationId ==
                                    this.variation.variationId);
                            return Text(
                              '+${PriceConverter.convertPrice(
                                variation.variationValues![i].optionPrice,
                                isVariation: true,
                              )}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              style: controller
                                      .selectedVariations[variationIndex][i]!
                                  ? robotoMedium.copyWith(
                                      fontSize: Dimensions.fontSizeExtraSmall)
                                  : robotoRegular.copyWith(
                                      fontSize: Dimensions.fontSizeExtraSmall,
                                      color: Theme.of(context).disabledColor,
                                    ),
                            );
                          }),
                          if (variation.variationValues![i].child.isNotEmpty)
                            IconButton(
                              onPressed: () =>
                                  WoltModalSheet.of(modalSheetContext).pushPage(
                                VariationBottomSheetWidget.getWoltSheet(
                                  modalSheetContext,
                                  product: product,
                                  variations:
                                      variation.variationValues![i].child,
                                  parentVariation: (i, variation),
                                ),
                              ),
                              padding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                  horizontal: -3, vertical: -3),
                              icon: Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                        ]),
                      ),
                    );
                  });
                }
              },
            );
          }),
        ]),
      );
    });
  }
}
