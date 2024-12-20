import 'dart:convert';

import 'package:yum2go_v3_customer/features/splash/domain/models/config_model.dart';

class ProductModel {
  int? totalSize;
  String? limit;
  int? offset;
  List<Product>? products;

  ProductModel({this.totalSize, this.limit, this.offset, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'].toString();
    offset =
        (json['offset'] != null && json['offset'].toString().trim().isNotEmpty)
            ? int.parse(json['offset'].toString())
            : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        // final variations = v['variations'] is String
        //     ? jsonDecode(v['variations'])
        //     : v['variations'];
        // if (variations.isEmpty || variations[0]['values'] != null) {
          products!.add(Product.fromJson(v));
        // }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  List<CategoryIds>? categoryIds;
  List<Variation> variations;
  List<AddOns>? addOns;
  List<ChoiceOptions>? choiceOptions;
  double? price;
  double? tax;
  double? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? restaurantId;
  String? restaurantName;
  double? restaurantDiscount;
  int? restaurantStatus;
  bool? scheduleOrder;
  double? avgRating;
  int? ratingCount;
  int? veg;
  int? cartQuantityLimit;
  bool? isRestaurantHalalActive;
  bool? isHalalFood;
  String? stockType;
  int? itemStock;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations = const [],
    this.addOns,
    this.choiceOptions,
    this.price,
    this.tax,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.restaurantId,
    this.restaurantName,
    this.restaurantDiscount,
    this.restaurantStatus,
    this.scheduleOrder,
    this.avgRating,
    this.ratingCount,
    this.veg,
    this.cartQuantityLimit,
    this.isRestaurantHalalActive,
    this.isHalalFood,
    this.stockType,
    this.itemStock,
  });

  String imageUrl(BaseUrls? baseUrls, [bool isCampaign = false]) =>
      (isCampaign ? baseUrls?.campaignImageUrl : baseUrls?.productImageUrl) ??
      '';

  Product.fromJson(Map<String, dynamic> json, {this.variations = const []}) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];
    if (json['category_ids'] != null) {
      categoryIds = [];
      json['category_ids'].forEach((v) {
        categoryIds!.add(CategoryIds.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = [];
      List jsonValue = json['variations'] is String
          ? jsonDecode(json['variations'])
          : json['variations'];

      for (final v in jsonValue) {
        variations.add(Variation.fromJson(v));
      }
    }
    if (json['add_ons'] != null) {
      addOns = [];
      if (json['add_ons'].length > 0 && json['add_ons'][0] != '[') {
        json['add_ons'].forEach((v) {
          addOns!.add(AddOns.fromJson(v));
        });
      } else if (json['addons'] != null) {
        json['addons'].forEach((v) {
          addOns!.add(AddOns.fromJson(v));
        });
      }
    }
    if (json['choice_options'] != null && json['choice_options'] is! String) {
      choiceOptions = [];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(ChoiceOptions.fromJson(v));
      });
    }
    price = json['price'].toDouble();
    tax = json['tax']?.toDouble();
    discount = json['discount'].toDouble();
    discountType = json['discount_type'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantDiscount = json['restaurant_discount'].toDouble();
    restaurantStatus = json['restaurant_status'];
    scheduleOrder = json['schedule_order'];
    avgRating = json['avg_rating'].toDouble();
    ratingCount = json['rating_count'];
    veg = json['veg'] != null ? int.parse(json['veg'].toString()) : 0;
    cartQuantityLimit = json['maximum_cart_quantity'];
    isRestaurantHalalActive = json['halal_tag_status'] == 1;
    isHalalFood = json['is_halal'] == 1;
    stockType = json['stock_type'];
    itemStock = int.tryParse(json['item_stock'].toString());
  }

  List<Variation> get allVariations {
    return _getVariations(variations);
  }

  List<Variation> allVariationsExcept(Variation variation) {
    return _getVariations(variations, variation)
        .where((element) => element != variation)
        .toList();
  }

  List<Variation> _getVariations(List<Variation> variations,
      [Variation? filter]) {
    return variations.fold([], (acc, variation) {
      if (filter != null && filter.variationId == variation.variationId) {
        return acc;
      }
      acc.add(variation);
      variation.variationValues?.forEach((value) {
        if (value.child.isNotEmpty) {
          acc.addAll(_getVariations(value.child));
        }
      });
      return acc;
    });
  }

  int variationIndex(Variation variation) => allVariations
      .indexWhere((element) => element.variationId == variation.variationId);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['category_id'] = categoryId;
    if (categoryIds != null) {
      data['category_ids'] = categoryIds!.map((v) => v.toJson()).toList();
    }
    data['variations'] = variations.map((v) => v.toJson()).toList();
    if (addOns != null) {
      data['add_ons'] = addOns!.map((v) => v.toJson()).toList();
    }
    if (choiceOptions != null) {
      data['choice_options'] = choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['tax'] = tax;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['available_time_starts'] = availableTimeStarts;
    data['available_time_ends'] = availableTimeEnds;
    data['restaurant_id'] = restaurantId;
    data['restaurant_name'] = restaurantName;
    data['restaurant_discount'] = restaurantDiscount;
    data['restaurant_status'] = restaurantStatus;
    data['schedule_order'] = scheduleOrder;
    data['avg_rating'] = avgRating;
    data['rating_count'] = ratingCount;
    data['veg'] = veg;
    data['maximum_cart_quantity'] = cartQuantityLimit;
    data['halal_tag_status'] = isRestaurantHalalActive;
    data['is_halal'] = isHalalFood;
    data['stock_type'] = stockType;
    data['item_stock'] = itemStock;
    return data;
  }
}

class CategoryIds {
  String? id;

  CategoryIds({this.id});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Variation {
  int? variationId;
  String? name;
  bool? multiSelect;
  int? min;
  int? max;
  bool? required;
  List<VariationValue>? variationValues;

  Variation(
      {this.variationId,
      this.name,
      this.multiSelect,
      this.min,
      this.max,
      this.required,
      this.variationValues});

  Variation.fromJson(Map<String, dynamic> json) {
    if (json['max'] != null) {
      variationId = json['variation_id'];
      name = json['name'];
      multiSelect = json['type'] == 'multi';
      min = multiSelect! ? int.parse(json['min'].toString()) : 0;
      max = multiSelect! ? int.parse(json['max'].toString()) : 0;
      required = json['required'] == 'on';
      if (json['values'] != null) {
        variationValues = [];
        for (final v in json['values'] as List) {
          variationValues!.add(VariationValue.fromJson(v));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variation_id'] = variationId;
    data['name'] = name;
    data['type'] = multiSelect;
    data['min'] = min;
    data['max'] = max;
    data['required'] = required;
    if (variationValues != null) {
      data['values'] = variationValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VariationValue {
  String? level;
  double? optionPrice;
  bool? isSelected;
  String? stockType;
  int? currentStock;
  int? optionId;
  List<Variation> child;

  VariationValue({
    this.level,
    this.optionPrice,
    this.isSelected,
    this.stockType,
    this.currentStock,
    this.optionId,
    this.child = const [],
  });

  factory VariationValue.fromJson(Map<String, dynamic> json) {
    final level = json['label'];
    final optionPrice = double.parse(json['optionPrice'].toString());
    final isSelected = json['isSelected'];
    final stockType = json['stock_type'];
    final currentStock = int.tryParse(json['current_stock'].toString());
    final optionId = json['option_id'];
    List<Variation> child = [];
    for (final v in json['child'] as List) {
      child.add(Variation.fromJson(v));
    }
    return VariationValue(
      level: level,
      optionPrice: optionPrice,
      isSelected: isSelected,
      stockType: stockType,
      currentStock: currentStock,
      optionId: optionId,
      child: child,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = level;
    data['optionPrice'] = optionPrice;
    data['isSelected'] = isSelected;
    data['stock_type'] = stockType;
    data['current_stock'] = currentStock;
    data['option_id'] = optionId;
    data['child'] = child.map((v) => v.toJson()).toList();
    return data;
  }

  bool canToggleCheckboxOrRadio([bool previousValue = false]) {
    return child.isEmpty || previousValue;
  }
}

class AddOns {
  int? id;
  String? name;
  double? price;
  String? stockType;
  int? addonStock;

  AddOns({
    this.id,
    this.name,
    this.price,
    this.stockType,
    this.addonStock,
  });

  AddOns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toDouble();
    stockType = json['stock_type'];
    addonStock = json['addon_stock'] != null
        ? int.parse(json['addon_stock'].toString())
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['stock_type'] = stockType;
    data['addon_stock'] = addonStock;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title'] = title;
    data['options'] = options;
    return data;
  }
}
