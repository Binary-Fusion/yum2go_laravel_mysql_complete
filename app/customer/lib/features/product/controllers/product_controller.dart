import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/common/widgets/confirmation_dialog_widget.dart';
import 'package:yum2go_v3_customer/common/widgets/product_bottom_sheet_widget.dart';
import 'package:yum2go_v3_customer/features/cart/controllers/cart_controller.dart';
import 'package:yum2go_v3_customer/features/cart/domain/models/cart_model.dart';
import 'package:yum2go_v3_customer/features/checkout/domain/models/place_order_body_model.dart';
import 'package:yum2go_v3_customer/features/product/domain/services/product_service_interface.dart';
import 'package:yum2go_v3_customer/helper/price_converter.dart';
import 'package:yum2go_v3_customer/util/images.dart';

import '../../../helper/modal_sheet/wolt_modal_sheet_helper.dart';

class ProductController extends GetxController implements GetxService {
  static final List<String> _productTypeList = ['all', 'veg', 'non_veg'];
  final ProductServiceInterface productServiceInterface;

  List<Product>? _popularProductList;
  bool _isLoading = false;

  List<List<bool?>> _selectedVariations = [];
  List<Variation>? _variations;

  int? _quantity = 1;
  List<bool> _addOnActiveList = [];

  List<int?> _addOnQtyList = [];
  String _popularType = 'all';

  int _cartIndex = -1;
  int _imageIndex = 0;

  List<bool> _collapseVariation = [];
  bool _canAddToCartProduct = true;

  List<List<int?>> _variationsStock = [];
  Product? _product;

  ProductController({required this.productServiceInterface});
  List<bool> get addOnActiveList => _addOnActiveList;

  List<int?> get addOnQtyList => _addOnQtyList;
  bool get canAddToCartProduct => _canAddToCartProduct;

  int get cartIndex => _cartIndex;
  List<bool> get collapseVariation => _collapseVariation;

  int get imageIndex => _imageIndex;
  bool get isLoading => _isLoading;

  List<Product>? get popularProductList => _popularProductList;
  String get popularType => _popularType;

  Product? get product => _product;
  List<String> get productTypeList => _productTypeList;

  int? get quantity => _quantity;
  List<List<bool?>> get selectedVariations => _selectedVariations;

  List<Variation>? get variations => _variations;
  List<List<int?>> get variationsStock => _variationsStock;

  void addAddOn(bool isAdd, int index, String? stockType, int? stock) {
    if (stock != null && (stock > 0 && stockType != 'unlimited') ||
        (stockType == 'unlimited')) {
      _addOnActiveList[index] = isAdd;
    } /* else {
      // showCustomSnackBar('addon_out_of_stock'.tr, showToaster: true);
    }*/
    update();
  }

  void changeCanAddToCartProduct(bool status) {
    _canAddToCartProduct = status;
  }

  String? checkOutOfStockVariationSelected(List<Variation>? variations) {
    for (int i = 0; i < _selectedVariations.length; i++) {
      for (int j = 0; j < _selectedVariations[i].length; j++) {
        if (_selectedVariations[i][j]!) {
          if (variations![i].variationValues![j].currentStock != null &&
              variations[i].variationValues![j].currentStock! <= 0 &&
              variations[i].variationValues![j].stockType != 'unlimited') {
            return '${variations[i].variationValues![j].level} ${'variation_is_out_of_stock'.tr}';
          }
        }
      }
    }
    return null;
  }

  Future<void> getPopularProductList(
      bool reload, String type, bool notify) async {
    _popularType = type;
    if (reload) {
      _popularProductList = null;
    }
    if (notify) {
      update();
    }
    if (_popularProductList == null || reload) {
      _popularProductList =
          await productServiceInterface.getPopularProductList(type: type);
      update();
    }
  }

  Future<Product?> getProductDetails(int id, CartModel? cart,
      {bool isCampaign = false, bool init = true}) async {
    if (!init) {
      return productServiceInterface.getProductDetails(
        id: id,
        isCampaign: false,
      );
    }
    _product = null;
    _product = await productServiceInterface.getProductDetails(
        id: id, isCampaign: isCampaign);
    initData(_product, cart);
    update();
    return _product;
  }

  void initData(Product? product, CartModel? cart) {
    _canAddToCartProduct = true;
    _selectedVariations = [];
    _variationsStock = [];
    _addOnQtyList = [];
    _addOnActiveList = [];
    _collapseVariation = [];
    if (cart != null) {
      _quantity = cart.quantity;
      _selectedVariations.addAll(cart.variations!);
      _variationsStock = productServiceInterface
          .initializeVariationsStock(product!.allVariations);
      _addOnActiveList = productServiceInterface.initializeCartAddonActiveList(
          product, cart.addOnIds);
      _addOnQtyList = productServiceInterface.initializeCartAddonQuantityList(
          product, cart.addOnIds);
      _collapseVariation = productServiceInterface
          .initializeCollapseVariation(product.allVariations);
    } else {
      _quantity = 1;
      _selectedVariations = productServiceInterface
          .initializeSelectedVariation(product!.allVariations);
      _variationsStock =
          productServiceInterface.initializeVariationsStock(product.allVariations);
      _collapseVariation = productServiceInterface
          .initializeCollapseVariation(product.allVariations);
      _addOnActiveList =
          productServiceInterface.initializeAddonActiveList(product.addOns);
      _addOnQtyList =
          productServiceInterface.initializeAddonQuantityList(product.addOns);
    }
    setExistInCartForBottomSheet(product, selectedVariations);
    _variations = product.allVariations;
  }

  void productDirectlyAddToCart(Product product, BuildContext context,
      {bool inStore = false, bool isCampaign = false}) {
    if ((product.allVariations.isEmpty)) {
      double price = product.price!;
      double discount = product.discount!;
      double discountPrice = PriceConverter.convertWithDiscount(
          price, discount, product.discountType)!;

      CartModel cartModel = CartModel(
        null,
        price,
        discountPrice,
        (price - discountPrice),
        1,
        [],
        [],
        false,
        product,
        [],
        product.cartQuantityLimit,
        [],
      );

      OnlineCart onlineCart = OnlineCart(
        null,
        isCampaign ? null : product.id,
        isCampaign ? product.id : null,
        discountPrice.toString(),
        [],
        1,
        [],
        [],
        [],
        'Food',
      );

      setExistInCart(product);

      if (Get.find<CartController>()
          .existAnotherRestaurantProduct(cartModel.product!.restaurantId)) {
        Get.dialog(
            ConfirmationDialogWidget(
              icon: Images.warning,
              title: 'are_you_sure_to_reset'.tr,
              description: 'if_you_continue'.tr,
              onYesPressed: () {
                Get.back();
                Get.find<CartController>()
                    .clearCartOnline()
                    .then((success) async {
                  if (success) {
                    await Get.find<CartController>()
                        .addToCartOnline(onlineCart, fromDirectlyAdd: true);
                  }
                });
              },
            ),
            barrierDismissible: false);
      } else {
        Get.find<CartController>()
            .addToCartOnline(onlineCart, fromDirectlyAdd: true);
      }
    } else {
      showWoltModalSheet(context, (modalSheetContext) {
        return ProductBottomSheetWidget.getWoltSheet(
          modalSheetContext,
          product: product,
          isCampaign: isCampaign,
        );
      });
      // ResponsiveHelper.isMobile(context)
      //     ? Get.bottomSheet(
      //         ProductBottomSheetWidget(product: product, isCampaign: false),
      //         backgroundColor: Colors.transparent,
      //         isScrollControlled: true,
      //       )
      //     : Get.dialog(
      //         Dialog(
      //             child: ProductBottomSheetWidget(
      //                 product: product, isCampaign: false)),
      //       );
    }
  }

  int selectedVariationLength(List<List<bool?>> selectedVariations, int index) {
    return productServiceInterface.selectedVariationLength(
        selectedVariations, index);
  }

  void setAddOnQuantity(
      bool isIncrement, int index, String? stockType, int? addonStock) {
    _addOnQtyList[index] = productServiceInterface.setAddonQuantity(
        _addOnQtyList[index]!, isIncrement, stockType, addonStock);
    update();
  }

  void setCartVariationEnabledIndex(
      int index, int i, Product? product, bool isMultiSelect) {
    _selectedVariations = productServiceInterface.setCartVariationEnabledIndex(
        index, i, product!.allVariations, isMultiSelect, _selectedVariations);

    update();

    if (isMultiSelect) {
      if (_selectedVariations[index][i] == true) return;
      if (product.allVariations[index].variationValues![i].child.isEmpty) {
        return;
      }
      final variations = product.allVariations[index].variationValues![i].child;
      for (int j = 0; j < variations.length; j++) {
        final variationIndex = product.allVariations.indexWhere(
            (element) => element.variationId == variations[j].variationId);
        for (int k = 0; k < variations[j].variationValues!.length; k++) {
          setCartVariationIndex(
              variationIndex, k, product, isMultiSelect, false);
        }
      }
    } else {
      for (int j = 0;
          j < product.allVariations[index].variationValues!.length;
          j++) {
        if (j == i &&
            _selectedVariations[index][j] == true) {
          continue;
        }
        for (final variation
            in product.allVariations[index].variationValues![j].child) {
          final variationId = product.variationIndex(variation);
          for (int k = 0; k < variation.variationValues!.length; k++) {
            setCartVariationIndex(
                variationId, k, product, variation.multiSelect!, false);
          }
        }
      }
    }
  }

  void setCartVariationIndex(
      int index, int i, Product? product, bool isMultiSelect,
      [bool? defaultValue]) {
    _selectedVariations = productServiceInterface.setCartVariationIndex(
        index,
        i,
        product!.allVariations,
        isMultiSelect,
        _selectedVariations,
        defaultValue);

    update();

    if (isMultiSelect) {
      if (_selectedVariations[index][i] == true) return;
      if (product.allVariations[index].variationValues![i].child.isEmpty) {
        return;
      }
      final variations = product.allVariations[index].variationValues![i].child;
      for (int j = 0; j < variations.length; j++) {
        final variationIndex = product.allVariations.indexWhere(
            (element) => element.variationId == variations[j].variationId);
        for (int k = 0; k < variations[j].variationValues!.length; k++) {
          setCartVariationIndex(
              variationIndex, k, product, isMultiSelect, false);
        }
      }
    } else {
      for (int j = 0;
          j < product.allVariations[index].variationValues!.length;
          j++) {
        if (j == i &&
            _selectedVariations[index][j] == true &&
            defaultValue == null) {
          continue;
        }
        for (final variation
            in product.allVariations[index].variationValues![j].child) {
          final variationId = product.variationIndex(variation);
          for (int k = 0; k < variation.variationValues!.length; k++) {
            setCartVariationIndex(
                variationId, k, product, variation.multiSelect!, false);
          }
        }
      }
    }
  }

  int setExistInCart(Product product, {bool notify = true}) {
    _cartIndex = Get.find<CartController>().isExistInCart(product.id, null);
    if (_cartIndex != -1) {
      _quantity = Get.find<CartController>().cartList[_cartIndex].quantity;
      _addOnActiveList = productServiceInterface.initializeCartAddonActiveList(
          product, Get.find<CartController>().cartList[_cartIndex].addOnIds!);
      _addOnQtyList = productServiceInterface.initializeCartAddonQuantityList(
          product, Get.find<CartController>().cartList[_cartIndex].addOnIds!);
    }
    return _cartIndex;
  }

  int setExistInCartForBottomSheet(
      Product product, List<List<bool?>>? selectedVariations,
      {bool notify = true}) {
    _cartIndex = productServiceInterface.isExistInCartForBottomSheet(
        Get.find<CartController>().cartList,
        product.id,
        null,
        selectedVariations);
    if (_cartIndex != -1) {
      _quantity = Get.find<CartController>().cartList[_cartIndex].quantity;
      _addOnActiveList = productServiceInterface.initializeCartAddonActiveList(
          product, Get.find<CartController>().cartList[_cartIndex].addOnIds!);
      _addOnQtyList = productServiceInterface.initializeCartAddonQuantityList(
          product, Get.find<CartController>().cartList[_cartIndex].addOnIds!);
    } else {
      _quantity = 1;
    }
    return _cartIndex;
  }

  void setImageIndex(int index, bool notify) {
    _imageIndex = index;
    if (notify) {
      update();
    }
  }

  void setQuantity(bool isIncrement, int? cartQuantityLimit, String? stockType,
      int? itemStock, bool isCampaign) {
    _quantity = productServiceInterface.setQuantity(
        isIncrement,
        cartQuantityLimit,
        _quantity!,
        _selectedVariations,
        _variationsStock,
        stockType,
        itemStock,
        isCampaign);
    update();
  }

  void setVariationValue(
      Product product, Variation variation, int i, bool value) {
    final variationIndex = product.allVariations
        .indexWhere((element) => element.variationId == variation.variationId);
    if (variation.multiSelect!) {
      _selectedVariations[variationIndex][i] = value;
    } else {
      _selectedVariations[variationIndex] = _selectedVariations[variationIndex]
          .asMap()
          .entries
          .map((e) => e.key == i ? value : false)
          .toList();
    }
    update();

    if (variation.multiSelect!) {
      if (product
          .allVariations[variationIndex].variationValues![i].child.isEmpty) {
        return;
      } else {
        if (!value) {
          final variations =
              product.allVariations[variationIndex].variationValues![i].child;
          for (final v in variations) {
            for (int j = 0; j < v.variationValues!.length; j++) {
              setVariationValue(product, v, j, false);
            }
          }
        }
      }
    } else {
      final variationValues =
          product.allVariations[variationIndex].variationValues!;
      for (int j = 0; j < variationValues.length; j++) {
        if (j == i) continue;
        _selectedVariations[variationIndex][j] = false;
        if (variationValues[j].child.isEmpty) {
          continue;
        } else {
          for (final v in variationValues[j].child) {
            for (int k = 0; k < v.variationValues!.length; k++) {
              setVariationValue(product, v, k, false);
            }
          }
        }
      }
    }
    update();
  }

  void showBottomLoader() {
    _isLoading = true;
    update();
  }

  void hideBottomLoader() {
    _isLoading = false;
    update();
  }

  void showMoreSpecificSection(int index) {
    _collapseVariation[index] = !_collapseVariation[index];
    update();
  }
}
