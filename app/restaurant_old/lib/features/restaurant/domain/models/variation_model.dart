import 'package:flutter/cupertino.dart';

import 'product_model.dart';

class VariationModel {
  String? id;
  TextEditingController? nameController;
  bool required;
  bool isSingle;
  TextEditingController? minController;
  TextEditingController? maxController;
  List<Option>? options;
  String? parentOptionId;

  VariationModel({
    required this.id,
    this.nameController,
    this.required = false,
    this.isSingle = true,
    this.minController,
    this.maxController,
    this.options,
    this.parentOptionId,
  });

  Variation toVariation() {
    return Variation(
      id: int.tryParse(id.toString()) != null ? id : null,
      name: nameController?.text,
      required: required ? "on" : "off",
      type: isSingle ? "single" : "multi",
      min: minController?.text,
      max: maxController?.text,
      variationValues: options?.map((e) => e.toOption()).toList(),
    );
  }

  String validateMissingValue() {
    String validationMessage = "";
    final validLabel = nameController?.text.isNotEmpty ?? false;
    if (!validLabel) {
      validationMessage = "Variation Name field is required";
      return validationMessage;
    }
    if (!isSingle) {
      final validMin = minController?.text.isNotEmpty ?? false;
      if (!validMin) {
        validationMessage = "Min field is required";
        return validationMessage;
      }
      if (int.tryParse(minController!.text) == null) {
        validationMessage = "Min field is not a number";
        return validationMessage;
      }
      if (int.parse(minController!.text) < 0) {
        validationMessage = "Min field is less than 0";
        return validationMessage;
      }
      final validMax = maxController?.text.isNotEmpty ?? false;
      if (!validMax) {
        validationMessage = "Max field is required";
        return validationMessage;
      }
      if (int.tryParse(maxController!.text) == null) {
        validationMessage = "Max field is not a number";
        return validationMessage;
      }
      if (int.parse(maxController!.text) < 0) {
        validationMessage = "Max field is less than 0";
        return validationMessage;
      }
      if (int.parse(minController!.text) > int.parse(maxController!.text)) {
        validationMessage = "Min field is greater than Max field";
        return validationMessage;
      }

      // check if max is greater than option length
      if (int.parse(maxController!.text) > options!.length) {
        validationMessage = "Max field is greater than options";
        return validationMessage;
      }
    }
    final validOptions =
        options?.every((e) => e.validateMissingValue()) ?? false;
    if (!validOptions) {
      validationMessage = "Option Label field is required";
      return validationMessage;
    }
    return "";
  }
}

class Option {
  String? optionId;
  TextEditingController? optionNameController;
  TextEditingController? optionPriceController;
  TextEditingController? optionStockController;

  List<VariationModel>? child;

  Option(
      {required this.optionId,
      required this.optionNameController,
      required this.optionPriceController,
      required this.optionStockController,

      required this.child});

  VariationOption toOption() {
    return VariationOption(
      optionId: int.tryParse(optionId.toString()) != null ? optionId : null,
      level: optionNameController?.text,
      optionPrice: optionPriceController?.text,
      totalStock: optionStockController?.text,

      child: child?.map((e) => e.toVariation()).toList(),
    );
  }

  bool validateMissingValue() {
    final validLabel = optionNameController?.text.isNotEmpty ?? false;
    // final validPrice = optionPriceController?.text.isNotEmpty ?? false;
    // final validStock = optionStockController?.text.isNotEmpty ?? false;
    return validLabel;
  }
}
