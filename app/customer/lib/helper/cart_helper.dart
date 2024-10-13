import 'package:get/get.dart';
import 'package:yum2go_v3_customer/common/models/online_cart_model.dart';
import 'package:yum2go_v3_customer/common/models/product_model.dart' as pv;
import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/features/cart/domain/models/cart_model.dart';
import 'package:yum2go_v3_customer/features/checkout/domain/models/place_order_body_model.dart';
import 'package:yum2go_v3_customer/features/product/controllers/product_controller.dart';
import 'package:yum2go_v3_customer/helper/price_converter.dart';

class CartHelper {
  static (List<OrderVariation>, List<int?>) getSelectedVariations(
      {required List<pv.Variation>? productVariations,
      required List<List<bool?>> selectedVariations}) {
    List<OrderVariation> variations = [];
    List<int?> optionIds = [];
    for (int i = 0; i < productVariations!.length; i++) {
      if (selectedVariations[i].contains(true)) {
        variations.add(OrderVariation(
            name: productVariations[i].name,
            values: OrderVariationValue(label: [])));
        for (int j = 0; j < productVariations[i].variationValues!.length; j++) {
          if (selectedVariations[i][j]!) {
            variations[variations.length - 1]
                .values!
                .label!
                .add(productVariations[i].variationValues![j].level);
            if (productVariations[i].variationValues![j].optionId != null) {
              optionIds.add(productVariations[i].variationValues![j].optionId);
            }
          }
        }
      }
    }
    print('order variations: ${variations.map((e) => e.toJson())}');
    print('order optionIds: $optionIds');

    return (variations, optionIds);
  }

  static getSelectedAddonIds({required List<AddOn> addOnIdList}) {
    List<int?> listOfAddOnId = [];
    for (var addOn in addOnIdList) {
      listOfAddOnId.add(addOn.id);
    }
    return listOfAddOnId;
  }

  static getSelectedAddonQtnList({required List<AddOn> addOnIdList}) {
    List<int?> listOfAddOnQty = [];
    for (var addOn in addOnIdList) {
      listOfAddOnQty.add(addOn.quantity);
    }
    return listOfAddOnQty;
  }

  static Future<List<CartModel>> formatOnlineCartToLocalCart(
      {required List<OnlineCartModel> onlineCartModel}) async {
    List<CartModel> cartList = [];
    for (OnlineCartModel cart in onlineCartModel) {
      final product = cart.product!.allVariations.isNotEmpty
          ? cart.product!
          : await Get.find<ProductController>().getProductDetails(
              cart.product!.id!,
              null,
              isCampaign: false,
              init: false,
            );
      double price = cart.price!;
      double? discount = cart.product!.restaurantDiscount == 0
          ? cart.product!.discount!
          : cart.product!.restaurantDiscount!;
      String? discountType = (cart.product!.restaurantDiscount == 0)
          ? cart.product!.discountType
          : 'percent';
      double discountedPrice =
          PriceConverter.convertWithDiscount(price, discount, discountType)!;

      double? discountAmount = price - discountedPrice;
      int? quantity = cart.quantity;

      List<List<bool?>> selectedFoodVariations = [];
      List<List<int?>> variationsStock = [];
      List<bool> collapsVariation = [];

      final cartVariationsNameList =
          cart.variation!.map((e) => e.name).toList();
      final cartVariationsValueList = cart.variation!
          .fold(<String?>[], (acc, e) => [...acc, ...e.values!.label!]);

      // for (int index = 0; index < cart.product!.variations!.length; index++) {
      for (int index = 0; index < product!.allVariations.length; index++) {
        selectedFoodVariations.add([]);
        collapsVariation.add(true);
        variationsStock.add([]);
        for (int i = 0;
            i < product.allVariations[index].variationValues!.length;
            i++) {
          variationsStock[index].add(
              product.allVariations[index].variationValues![i].currentStock);

          final cartVariationNameCheck = cartVariationsNameList
              .contains(product.allVariations[index].name);

          Get.log('cart variation name check: $cartVariationNameCheck');

          if (!cartVariationNameCheck) {
            selectedFoodVariations[index].add(false);
            continue;
          }

          final cartVariationValueCheck = cartVariationsValueList
              .contains(product.allVariations[index].variationValues![i].level);

          Get.log('cart variation value check: $cartVariationValueCheck');

          if (cartVariationValueCheck) {
            selectedFoodVariations[index].add(true);
          } else {
            selectedFoodVariations[index].add(false);
          }
        }
      }

      List<AddOn> addOnIdList = [];
      List<AddOns> addOnsList = [];
      for (int index = 0; index < cart.addOnIds!.length; index++) {
        addOnIdList.add(
            AddOn(id: cart.addOnIds![index], quantity: cart.addOnQtys![index]));
        for (int i = 0; i < product.addOns!.length; i++) {
          if (cart.addOnIds![index] == product.addOns![i].id) {
            addOnsList.add(AddOns(
                id: product.addOns![i].id,
                name: product.addOns![i].name,
                price: product.addOns![i].price));
          }
        }
      }
      int? quantityLimit = cart.product!.cartQuantityLimit;
      cartList.add(
        CartModel(
          cart.id,
          price,
          discountedPrice,
          discountAmount,
          quantity,
          addOnIdList,
          addOnsList,
          false,
          cart.product,
          selectedFoodVariations,
          quantityLimit,
          variationsStock,
        ),
      );
    }
    return cartList;
  }

  static Future<String> setupVariationText({required CartModel cart}) async {
    List<String> variationTextList = [];

    final product = cart.product!.allVariations.isNotEmpty
        ? cart.product!
        : await Get.find<ProductController>().getProductDetails(
            cart.product!.id!,
            null,
            isCampaign: false,
            init: false,
          );

    // final productVariations =
    //     cart.product!.allVariations!.map((e) => e.name).join(', ');
    // final cartVariations = cart.variations!.toList().toString();

    // variationText = '$productVariations \n $cartVariations';

    if (cart.variations!.isNotEmpty) {
      for (int index = 0; index < product!.allVariations.length; index++) {
        String variationText = '';
        final cartVariation = cart.variations![index];
        final productVariation = product!.allVariations[index];

        if (cartVariation.isNotEmpty && cartVariation.contains(true)) {
          variationText +=
              '$variationText${variationText.isNotEmpty ? ', ' : ''}${productVariation.name}: ';
          for (int i = 0; i < productVariation.variationValues!.length; i++) {
            if (cartVariation[i]!) {
              variationText +=
                  '${productVariation.variationValues![i].level}, ';
            }
          }
          variationText = variationText.substring(0, variationText.length - 2);
          variationText += '';
        }
        variationTextList.add(variationText);
      }
    }
    // for (int index = 0; index < cart.variations!.length; index++) {
    //   if (cart.variations![index].isNotEmpty &&
    //       cart.variations![index].contains(true)) {
    //     variationText =
    //         '$variationText${variationText.isNotEmpty ? ', ' : ''}${cart.product!.allVariations![index].name} (';

    //     for (int i = 0; i < cart.variations![index].length; i++) {
    //       if (cart.variations![index][i]!) {
    //         variationText =
    //             '$variationText${variationText.endsWith('(') ? '' : ', '}${cart.product!.allVariations![index].variationValues![i].level}';
    //       }
    //     }
    //     variationText = '$variationText)';
    //   }
    // }
    // }

    return variationTextList.where((e) => e.isNotEmpty).toSet().join(',\n');
  }

  static String? setupAddonsText({required CartModel cart}) {
    String addOnText = '';
    int index0 = 0;
    List<int?> ids = [];
    List<int?> qtys = [];
    for (var addOn in cart.addOnIds!) {
      ids.add(addOn.id);
      qtys.add(addOn.quantity);
    }
    for (var addOn in cart.product!.addOns!) {
      if (ids.contains(addOn.id)) {
        addOnText =
            '$addOnText${(index0 == 0) ? '' : ',  '}${addOn.name} (${qtys[index0]})';
        index0 = index0 + 1;
      }
    }
    return addOnText;
  }
}
