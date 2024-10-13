import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor_restaurant/common/widgets/custom_text_field_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/controllers/restaurant_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/models/product_model.dart';
import 'package:stackfood_multivendor_restaurant/util/dimensions.dart';
import 'package:stackfood_multivendor_restaurant/util/styles.dart';

import '../domain/models/variation_model.dart';

class VariationViewWidget extends StatefulWidget {
  final RestaurantController restController;
  final Product? product;
  final Function(int?) callback;
  final Function(int?) deletedVariationId;
  final Function(int?) deletedVariationOptionId;
  const VariationViewWidget(
      {super.key,
      required this.restController,
      required this.product,
      required this.callback,
      required this.deletedVariationId,
      required this.deletedVariationOptionId});

  @override
  State<VariationViewWidget> createState() => _VariationViewWidgetState();
}

class _VariationViewWidgetState extends State<VariationViewWidget> {
  // void _calculateOptionStock() {
  //   int? totalOptionStock = 0;
  //   for (VariationModel variation in widget.restController.variationList!) {
  //     for (Option option in variation.options!) {
  //       int? a= int.tryParse(option.optionStockController!.text.trim()) ?? 0;
  //       totalOptionStock  = totalOptionStock! + a;
  //
  //     }
  //   }
  //   widget.callback(totalOptionStock);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Text('food_variations'.tr, style: robotoMedium),
          Text(' (${'optional'.tr})',
              style: robotoRegular.copyWith(
                  color: Theme.of(context).disabledColor)),
        ]),
        Visibility(
          visible: widget.restController.variationList!.isNotEmpty,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              widget.restController.addVariation();
            },
            child: Row(children: [
              Icon(Icons.add, color: Theme.of(context).primaryColor),
              Text('add_new_variation'.tr,
                  style: robotoRegular.copyWith(
                      color: Theme.of(context).disabledColor)),
            ]),
          ),
        ),
      ]),
      const SizedBox(height: Dimensions.paddingSizeSmall),
      // widget.restController.variationList!.isNotEmpty
      //     ? ListView.builder(
      //         itemCount: widget.restController.variationList!.length,
      //         shrinkWrap: true,
      //         physics: const NeverScrollableScrollPhysics(),
      //         itemBuilder: (context, index) {
      //           return Padding(
      //             padding: EdgeInsets.only(
      //                 bottom: widget.restController.variationList!.length - 1 ==
      //                         index
      //                     ? 0
      //                     : Dimensions.paddingSizeLarge),
      //             child: Container(
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: Dimensions.paddingSizeSmall,
      //                   vertical: Dimensions.paddingSizeLarge),
      //               decoration: BoxDecoration(
      //                 color: Theme.of(context).cardColor,
      //                 borderRadius:
      //                     BorderRadius.circular(Dimensions.radiusDefault),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Get.isDarkMode
      //                           ? Colors.black.withOpacity(0.2)
      //                           : Colors.grey.withOpacity(0.2),
      //                       spreadRadius: 1,
      //                       blurRadius: 10,
      //                       offset: const Offset(0, 1))
      //                 ],
      //               ),
      //               child: Column(
      //                 children: [
      //                   Align(
      //                     alignment: Alignment.topRight,
      //                     child: InkWell(
      //                       onTap: () {
      //                         if (widget.restController.variationList![index]
      //                                 .id !=
      //                             null) {
      //                           widget.deletedVariationId(int.parse(widget
      //                               .restController.variationList![index].id!));
      //                         }
      //                         widget.restController.removeVariation(index);
      //                         // _calculateOptionStock();
      //                       },
      //                       child: Icon(Icons.clear,
      //                           color: Theme.of(context).disabledColor),
      //                     ),
      //                   ),
      //                   Column(
      //                     children: [
      //                       SizedBox(
      //                           height: widget.restController.variationList!
      //                                       .length >
      //                                   1
      //                               ? 0
      //                               : Dimensions.paddingSizeLarge),
      //                       Row(children: [
      //                         Expanded(
      //                           flex: 2,
      //                           child: CustomTextFieldWidget(
      //                             hintText: 'name'.tr,
      //                             showTitle: false,
      //                             controller: widget.restController
      //                                 .variationList![index].nameController,
      //                             borderColor: Theme.of(context).disabledColor,
      //                           ),
      //                         ),
      //                         const SizedBox(
      //                             width: Dimensions.paddingSizeSmall),
      //                         Expanded(
      //                           flex: 1,
      //                           child: Row(children: [
      //                             Checkbox(
      //                               value: widget.restController
      //                                   .variationList![index].required,
      //                               onChanged: (bool? value) {
      //                                 widget.restController
      //                                     .setVariationRequired(index);
      //                               },
      //                               activeColor: Theme.of(context).primaryColor,
      //                               side: BorderSide(
      //                                   width: 2,
      //                                   color: Theme.of(context).primaryColor),
      //                               shape: RoundedRectangleBorder(
      //                                   borderRadius: BorderRadius.circular(
      //                                       Dimensions.radiusSmall)),
      //                             ),
      //                             Text('required'.tr,
      //                                 style: robotoRegular.copyWith(
      //                                     color: Theme.of(context).hintColor)),
      //                           ]),
      //                         ),
      //                       ]),
      //                       const SizedBox(height: Dimensions.paddingSizeLarge),
      //                       Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text('select_type'.tr,
      //                                 style: robotoRegular.copyWith(
      //                                     fontSize: Dimensions.fontSizeLarge)),
      //                             const SizedBox(
      //                                 height: Dimensions.paddingSizeDefault),
      //                             Row(children: [
      //                               InkWell(
      //                                 onTap: () => widget.restController
      //                                     .changeSelectVariationType(index),
      //                                 child: Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.start,
      //                                     children: [
      //                                       Radio(
      //                                         value: true,
      //                                         groupValue: widget
      //                                             .restController
      //                                             .variationList![index]
      //                                             .isSingle,
      //                                         onChanged: (bool? value) {
      //                                           widget.restController
      //                                               .changeSelectVariationType(
      //                                                   index);
      //                                         },
      //                                         activeColor: Theme.of(context)
      //                                             .primaryColor,
      //                                         fillColor:
      //                                             WidgetStateProperty.all(widget
      //                                                     .restController
      //                                                     .variationList![index]
      //                                                     .isSingle
      //                                                 ? Theme.of(context)
      //                                                     .primaryColor
      //                                                 : Theme.of(context)
      //                                                     .disabledColor
      //                                                     .withOpacity(0.6)),
      //                                         visualDensity:
      //                                             const VisualDensity(
      //                                                 horizontal: VisualDensity
      //                                                     .minimumDensity,
      //                                                 vertical: VisualDensity
      //                                                     .minimumDensity),
      //                                         materialTapTargetSize:
      //                                             MaterialTapTargetSize
      //                                                 .shrinkWrap,
      //                                       ),
      //                                       const SizedBox(
      //                                           width: Dimensions
      //                                               .paddingSizeSmall),
      //                                       Text('single'.tr,
      //                                           style: robotoMedium.copyWith(
      //                                               color: widget
      //                                                       .restController
      //                                                       .variationList![
      //                                                           index]
      //                                                       .isSingle
      //                                                   ? Theme.of(context)
      //                                                       .textTheme
      //                                                       .bodyLarge
      //                                                       ?.color
      //                                                   : Theme.of(context)
      //                                                       .disabledColor,
      //                                               fontSize: 13)),
      //                                     ]),
      //                               ),
      //                               const SizedBox(
      //                                   width: Dimensions
      //                                       .paddingSizeOverExtraLarge),
      //                               InkWell(
      //                                 onTap: () => widget.restController
      //                                     .changeSelectVariationType(index),
      //                                 child: Row(children: [
      //                                   Radio(
      //                                     value: false,
      //                                     groupValue: widget.restController
      //                                         .variationList![index].isSingle,
      //                                     onChanged: (bool? value) {
      //                                       widget.restController
      //                                           .changeSelectVariationType(
      //                                               index);
      //                                     },
      //                                     activeColor:
      //                                         Theme.of(context).primaryColor,
      //                                     fillColor: WidgetStateProperty.all(
      //                                         !widget
      //                                                 .restController
      //                                                 .variationList![index]
      //                                                 .isSingle
      //                                             ? Theme.of(context)
      //                                                 .primaryColor
      //                                             : Theme.of(context)
      //                                                 .disabledColor
      //                                                 .withOpacity(0.6)),
      //                                     visualDensity: const VisualDensity(
      //                                         horizontal:
      //                                             VisualDensity.minimumDensity,
      //                                         vertical:
      //                                             VisualDensity.minimumDensity),
      //                                     materialTapTargetSize:
      //                                         MaterialTapTargetSize.shrinkWrap,
      //                                   ),
      //                                   const SizedBox(
      //                                       width: Dimensions.paddingSizeSmall),
      //                                   Text('multiple'.tr,
      //                                       style: robotoMedium.copyWith(
      //                                           color: !widget
      //                                                   .restController
      //                                                   .variationList![index]
      //                                                   .isSingle
      //                                               ? Theme.of(context)
      //                                                   .textTheme
      //                                                   .bodyLarge
      //                                                   ?.color
      //                                               : Theme.of(context)
      //                                                   .disabledColor,
      //                                           fontSize: 13)),
      //                                 ]),
      //                               ),
      //                             ]),
      //                             const SizedBox(
      //                                 height: Dimensions.paddingSizeDefault),
      //                           ]),
      //                       Visibility(
      //                         visible: !widget.restController
      //                             .variationList![index].isSingle,
      //                         child: Row(children: [
      //                           Flexible(
      //                             child: CustomTextFieldWidget(
      //                               hintText: 'min'.tr,
      //                               showTitle: false,
      //                               inputType: TextInputType.number,
      //                               controller: widget.restController
      //                                   .variationList![index].minController,
      //                               borderColor:
      //                                   Theme.of(context).disabledColor,
      //                             ),
      //                           ),
      //                           const SizedBox(
      //                               width: Dimensions.paddingSizeSmall),
      //                           Flexible(
      //                             child: CustomTextFieldWidget(
      //                               hintText: 'max'.tr,
      //                               inputType: TextInputType.number,
      //                               showTitle: false,
      //                               controller: widget.restController
      //                                   .variationList![index].maxController,
      //                               borderColor:
      //                                   Theme.of(context).disabledColor,
      //                             ),
      //                           ),
      //                         ]),
      //                       ),
      //                       const SizedBox(height: Dimensions.paddingSizeSmall),
      //                       Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           ListView.builder(
      //                             itemCount: widget.restController
      //                                 .variationList![index].options!.length,
      //                             shrinkWrap: true,
      //                             physics: const NeverScrollableScrollPhysics(),
      //                             itemBuilder: (context, i) {
      //                               if (widget.restController.stockTypeIndex ==
      //                                   0) {
      //                                 widget
      //                                     .restController
      //                                     .variationList![index]
      //                                     .options![i]
      //                                     .optionStockController
      //                                     ?.text = '';
      //                               }

      //                               return Padding(
      //                                 padding: EdgeInsets.only(
      //                                     bottom: widget
      //                                                     .restController
      //                                                     .variationList![index]
      //                                                     .options!
      //                                                     .length -
      //                                                 1 ==
      //                                             i
      //                                         ? 0
      //                                         : Dimensions.paddingSizeLarge),
      //                                 child: Container(
      //                                   decoration: BoxDecoration(
      //                                     color: Theme.of(context)
      //                                         .primaryColor
      //                                         .withOpacity(0.1),
      //                                     border: Border.all(
      //                                         color: Theme.of(context)
      //                                             .primaryColor
      //                                             .withOpacity(0.2),
      //                                         width: 1),
      //                                     borderRadius: BorderRadius.circular(
      //                                         Dimensions.radiusDefault),
      //                                   ),
      //                                   child: Column(
      //                                     crossAxisAlignment:
      //                                         CrossAxisAlignment.start,
      //                                     children: [
      //                                       Row(
      //                                         children: [
      //                                           Flexible(
      //                                             flex: 8,
      //                                             child: Container(
      //                                               padding: const EdgeInsets
      //                                                   .all(Dimensions
      //                                                       .paddingSizeSmall),
      //                                               decoration: BoxDecoration(
      //                                                 color: Theme.of(context)
      //                                                     .cardColor
      //                                                     .withOpacity(0.5),
      //                                                 borderRadius:
      //                                                     const BorderRadius
      //                                                         .only(
      //                                                   topLeft: Radius
      //                                                       .circular(Dimensions
      //                                                           .radiusDefault),
      //                                                   bottomLeft: Radius
      //                                                       .circular(Dimensions
      //                                                           .radiusDefault),
      //                                                 ),
      //                                               ),
      //                                               child: Column(
      //                                                 children: [
      //                                                   Row(
      //                                                     children: [
      //                                                       Flexible(
      //                                                         child:
      //                                                             CustomTextFieldWidget(
      //                                                           hintText:
      //                                                               'option_name'
      //                                                                   .tr,
      //                                                           showTitle:
      //                                                               false,
      //                                                           controller: widget
      //                                                               .restController
      //                                                               .variationList![
      //                                                                   index]
      //                                                               .options![i]
      //                                                               .optionNameController,
      //                                                           borderColor: Theme.of(
      //                                                                   context)
      //                                                               .disabledColor,
      //                                                         ),
      //                                                       ),
      //                                                       const SizedBox(
      //                                                           width: Dimensions
      //                                                               .paddingSizeSmall),
      //                                                       Flexible(
      //                                                         child:
      //                                                             CustomTextFieldWidget(
      //                                                           hintText:
      //                                                               'additional_price'
      //                                                                   .tr,
      //                                                           showTitle:
      //                                                               false,
      //                                                           controller: widget
      //                                                               .restController
      //                                                               .variationList![
      //                                                                   index]
      //                                                               .options![i]
      //                                                               .optionPriceController,
      //                                                           inputType:
      //                                                               TextInputType
      //                                                                   .number,
      //                                                           inputAction:
      //                                                               TextInputAction
      //                                                                   .done,
      //                                                           borderColor: Theme.of(
      //                                                                   context)
      //                                                               .disabledColor,
      //                                                         ),
      //                                                       ),
      //                                                     ],
      //                                                   ),
      //                                                   const SizedBox(
      //                                                       height: Dimensions
      //                                                           .paddingSizeSmall),
      //                                                   CustomTextFieldWidget(
      //                                                     titleText: 'stock'.tr,
      //                                                     hintText: widget
      //                                                                 .restController
      //                                                                 .stockTypeIndex ==
      //                                                             0
      //                                                         ? 'unlimited'.tr
      //                                                         : 'stock'.tr,
      //                                                     showTitle: false,
      //                                                     controller: widget
      //                                                         .restController
      //                                                         .variationList![
      //                                                             index]
      //                                                         .options![i]
      //                                                         .optionStockController,
      //                                                     inputType:
      //                                                         TextInputType
      //                                                             .phone,
      //                                                     inputAction:
      //                                                         TextInputAction
      //                                                             .done,
      //                                                     isEnabled: widget
      //                                                                 .restController
      //                                                                 .stockTypeIndex ==
      //                                                             0
      //                                                         ? false
      //                                                         : true,
      //                                                     borderColor: Theme.of(
      //                                                             context)
      //                                                         .disabledColor,
      //                                                     onChanged: (value) {
      //                                                       // int.parse(widget.restController.variationList![index].options![i].optionStockController!.text.trim());
      //                                                       // _calculateOptionStock();
      //                                                     },
      //                                                   ),
      //                                                 ],
      //                                               ),
      //                                             ),
      //                                           ),
      //                                           Flexible(
      //                                             flex: 1,
      //                                             child: Padding(
      //                                               padding: const EdgeInsets
      //                                                   .only(
      //                                                   top: Dimensions
      //                                                       .paddingSizeSmall),
      //                                               child: widget
      //                                                           .restController
      //                                                           .variationList![
      //                                                               index]
      //                                                           .options!
      //                                                           .length >
      //                                                       1
      //                                                   ? IconButton(
      //                                                       icon: Icon(
      //                                                           Icons.clear,
      //                                                           color: Theme.of(
      //                                                                   context)
      //                                                               .primaryColor),
      //                                                       onPressed: () {
      //                                                         if (widget
      //                                                                 .restController
      //                                                                 .variationList![
      //                                                                     index]
      //                                                                 .options![
      //                                                                     i]
      //                                                                 .optionId !=
      //                                                             null) {
      //                                                           widget
      //                                                               .deletedVariationOptionId(
      //                                                             int.parse(
      //                                                               widget
      //                                                                   .restController
      //                                                                   .variationList![
      //                                                                       index]
      //                                                                   .options![
      //                                                                       i]
      //                                                                   .optionId!,
      //                                                             ),
      //                                                           );
      //                                                         }
      //                                                         widget
      //                                                             .restController
      //                                                             .removeOptionVariation(
      //                                                           [index],
      //                                                           i,
      //                                                         );
      //                                                         // _calculateOptionStock();
      //                                                       },
      //                                                     )
      //                                                   : const SizedBox(),
      //                                             ),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               );
      //                             },
      //                           ),
      //                           const SizedBox(
      //                               height: Dimensions.paddingSizeLarge),
      //                           InkWell(
      //                             onTap: () {
      //                               widget.restController
      //                                   .addOptionVariation(index);
      //                             },
      //                             child: Container(
      //                               padding: const EdgeInsets.symmetric(
      //                                 horizontal: Dimensions.paddingSizeSmall,
      //                                 vertical: Dimensions.paddingSizeSmall,
      //                               ),
      //                               decoration: BoxDecoration(
      //                                 color: Theme.of(context).cardColor,
      //                                 borderRadius: BorderRadius.circular(
      //                                   Dimensions.radiusSmall,
      //                                 ),
      //                                 border: Border.all(
      //                                   color: Theme.of(context)
      //                                       .primaryColor
      //                                       .withOpacity(0.6),
      //                                 ),
      //                               ),
      //                               child: Text(
      //                                 'add_new_option'.tr,
      //                                 style: robotoRegular.copyWith(
      //                                   color: Theme.of(context).primaryColor,
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       )
      //     : const SizedBox(),
      OptionListWidget(
        variationList: widget.restController.variationList,
        // parentOptionId: widget.restController.variationList![index].id,
      ),
      Visibility(
        visible: widget.restController.variationList!.isEmpty,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeSmall,
              vertical: Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            boxShadow: [
              BoxShadow(
                  color: Get.isDarkMode
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1))
            ],
          ),
          child: InkWell(
            onTap: () {
              widget.restController.addVariation();
            },
            child: Container(
              width: context.width,
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall,
                  vertical: Dimensions.paddingSizeLarge),
              decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
              child: Column(children: [
                const Icon(Icons.add, size: 24),
                Text('add_variation'.tr,
                    style: robotoRegular.copyWith(
                        color: Theme.of(context).disabledColor)),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}

class OptionListWidget extends GetView<RestaurantController> {
  const OptionListWidget(
      {super.key, required this.variationList, this.parentOptionId});

  final String? parentOptionId;

  final List<VariationModel>? variationList;

  @override
  Widget build(BuildContext context) {
    if (variationList?.isEmpty ?? true) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: variationList!.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          key: Key(variationList![index].id!),
          padding: EdgeInsets.only(
              bottom: variationList!.length - 1 == index
                  ? 0
                  : Dimensions.paddingSizeLarge),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall,
                vertical: Dimensions.paddingSizeLarge),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              boxShadow: [
                BoxShadow(
                    color: Get.isDarkMode
                        ? Colors.black.withOpacity(0.2)
                        : Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      if (controller.variationList![index].id != null) {
                        // widget.deletedVariationId(int.parse(
                        //     widget.restController.variationList![index].id!));
                      }
                      controller.removeVariation(index, parentOptionId);
                      // _calculateOptionStock();
                    },
                    child: Icon(Icons.clear,
                        color: Theme.of(context).disabledColor),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: controller.variationList!.length > 1
                            ? 0
                            : Dimensions.paddingSizeLarge),
                    CustomTextFieldWidget(
                      hintText: 'name'.tr,
                      showTitle: false,
                      controller: variationList![index].nameController,
                      borderColor: Theme.of(context).disabledColor,
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    Row(children: [
                      Checkbox(
                        value: variationList![index].required,
                        onChanged: (bool? value) {
                          controller.setVariationRequired(
                              index, parentOptionId);
                        },
                        activeColor: Theme.of(context).primaryColor,
                        side: BorderSide(
                            width: 2, color: Theme.of(context).primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusSmall)),
                      ),
                      Text('required'.tr,
                          style: robotoRegular.copyWith(
                              color: Theme.of(context).hintColor)),
                    ]),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('select_type'.tr,
                              style: robotoRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge)),
                          const SizedBox(height: Dimensions.paddingSizeDefault),
                          Row(children: [
                            InkWell(
                              onTap: () => controller.changeSelectVariationType(
                                  index, parentOptionId),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: true,
                                      groupValue:
                                          variationList![index].isSingle,
                                      onChanged: (bool? value) {
                                        controller.changeSelectVariationType(
                                            index, parentOptionId);
                                      },
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      fillColor: WidgetStatePropertyAll(
                                          variationList![index].isSingle
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .disabledColor
                                                  .withOpacity(0.6)),
                                      visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    const SizedBox(
                                        width: Dimensions.paddingSizeSmall),
                                    Text('single'.tr,
                                        style: robotoMedium.copyWith(
                                            color:
                                                variationList![index].isSingle
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.color
                                                    : Theme.of(context)
                                                        .disabledColor,
                                            fontSize: 13)),
                                  ]),
                            ),
                            const SizedBox(
                                width: Dimensions.paddingSizeOverExtraLarge),
                            InkWell(
                              onTap: () => controller.changeSelectVariationType(
                                  index, parentOptionId),
                              child: Row(children: [
                                Radio(
                                  value: false,
                                  groupValue: variationList![index].isSingle,
                                  onChanged: (bool? value) {
                                    controller.changeSelectVariationType(
                                        index, parentOptionId);
                                  },
                                  activeColor: Theme.of(context).primaryColor,
                                  fillColor: WidgetStatePropertyAll(
                                      !variationList![index].isSingle
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.6)),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity,
                                      vertical: VisualDensity.minimumDensity),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                const SizedBox(
                                    width: Dimensions.paddingSizeSmall),
                                Text('multiple'.tr,
                                    style: robotoMedium.copyWith(
                                        color: !variationList![index].isSingle
                                            ? Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color
                                            : Theme.of(context).disabledColor,
                                        fontSize: 13)),
                              ]),
                            ),
                          ]),
                          const SizedBox(height: Dimensions.paddingSizeDefault),
                        ]),
                    Visibility(
                      visible: !variationList![index].isSingle,
                      child: Row(children: [
                        Flexible(
                          child: CustomTextFieldWidget(
                            hintText: 'min'.tr,
                            showTitle: false,
                            inputType: TextInputType.number,
                            controller: variationList![index].minController,
                            borderColor: Theme.of(context).disabledColor,
                          ),
                        ),
                        const SizedBox(width: Dimensions.paddingSizeSmall),
                        Flexible(
                          child: CustomTextFieldWidget(
                            hintText: 'max'.tr,
                            inputType: TextInputType.number,
                            showTitle: false,
                            controller: variationList![index].maxController,
                            borderColor: Theme.of(context).disabledColor,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          itemCount: variationList![index].options!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            if (controller.stockTypeIndex == 0) {
                              variationList![index]
                                  .options![i]
                                  .optionStockController
                                  ?.text = '';
                            }

                            return Padding(
                              key: Key(
                                  variationList![index].options![i].optionId!),
                              padding: EdgeInsets.only(
                                  bottom:
                                      variationList![index].options!.length -
                                                  1 ==
                                              i
                                          ? 0
                                          : Dimensions.paddingSizeLarge),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 8,
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                Dimensions.paddingSizeSmall),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .cardColor
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    Dimensions.radiusDefault),
                                                bottomLeft: Radius.circular(
                                                    Dimensions.radiusDefault),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child:
                                                          CustomTextFieldWidget(
                                                        hintText:
                                                            'option_name'.tr,
                                                        showTitle: false,
                                                        controller: variationList![
                                                                index]
                                                            .options![i]
                                                            .optionNameController,
                                                        borderColor:
                                                            Theme.of(context)
                                                                .disabledColor,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        width: Dimensions
                                                            .paddingSizeSmall),
                                                    Flexible(
                                                      child:
                                                          CustomTextFieldWidget(
                                                        hintText:
                                                            'additional_price'
                                                                .tr,
                                                        showTitle: false,
                                                        controller: variationList![
                                                                index]
                                                            .options![i]
                                                            .optionPriceController,
                                                        inputType: TextInputType
                                                            .number,
                                                        inputAction:
                                                            TextInputAction
                                                                .done,
                                                        borderColor:
                                                            Theme.of(context)
                                                                .disabledColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                    height: Dimensions
                                                        .paddingSizeSmall),
                                                CustomTextFieldWidget(
                                                  titleText: 'stock'.tr,
                                                  hintText: controller
                                                              .stockTypeIndex ==
                                                          0
                                                      ? 'unlimited'.tr
                                                      : 'stock'.tr,
                                                  showTitle: false,
                                                  controller: variationList![
                                                          index]
                                                      .options![i]
                                                      .optionStockController,
                                                  inputType:
                                                      TextInputType.phone,
                                                  inputAction:
                                                      TextInputAction.done,
                                                  isEnabled: controller
                                                              .stockTypeIndex ==
                                                          0
                                                      ? false
                                                      : true,
                                                  borderColor: Theme.of(context)
                                                      .disabledColor,
                                                  onChanged: (value) {
                                                    // int.parse(widget.restController.variationList![index].options![i].optionStockController!.text.trim());
                                                    // _calculateOptionStock();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              variationList![index]
                                                          .options!
                                                          .length >
                                                      1
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        bottom: Dimensions
                                                            .paddingSizeSmall,
                                                      ),
                                                      child: IconButton(
                                                        icon: Icon(Icons.clear,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                        onPressed: () {
                                                          if (variationList![
                                                                      index]
                                                                  .options![i]
                                                                  .optionId !=
                                                              null) {
                                                            // controller
                                                            //     .deletedVariationOptionId(
                                                            //   int.parse(
                                                            //     widget
                                                            //         .restController
                                                            //         .variationList![
                                                            //             index]
                                                            //         .options![
                                                            //             i]
                                                            //         .optionId!,
                                                            //   ),
                                                            // );
                                                          }
                                                          controller
                                                              .removeOptionVariation(
                                                            variationList![
                                                                    index]
                                                                .id!,
                                                            variationList![
                                                                    index]
                                                                .options![i]
                                                                .optionId!,
                                                          );
                                                          // _calculateOptionStock();
                                                        },
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              IconButton(
                                                icon: Icon(Icons.add,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                onPressed: () {
                                                  controller.addVariation(
                                                    variationList![index]
                                                        .options![i]
                                                        .optionId!,
                                                  );
                                                  // _calculateOptionStock();
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    OptionListWidget(
                                      variationList: variationList![index]
                                          .options![i]
                                          .child,
                                      parentOptionId: variationList![index]
                                          .options![i]
                                          .optionId,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: Dimensions.paddingSizeLarge),
                        InkWell(
                          onTap: () {
                            controller.addOptionVariation(
                                index, variationList![index].id!);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSmall,
                              vertical: Dimensions.paddingSizeSmall,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radiusSmall,
                              ),
                              border: Border.all(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                              ),
                            ),
                            child: Text(
                              'add_new_option'.tr,
                              style: robotoRegular.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
