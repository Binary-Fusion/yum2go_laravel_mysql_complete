import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stackfood_multivendor_restaurant/common/widgets/custom_snackbar_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/addon/controllers/addon_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/category/controllers/category_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/profile/controllers/profile_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/profile/domain/models/profile_model.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/models/cuisine_model.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/models/product_model.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/models/review_model.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/models/variant_type_model.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/models/variation_model.dart';
import 'package:stackfood_multivendor_restaurant/features/restaurant/domain/services/restaurant_service_interface.dart';
import 'package:stackfood_multivendor_restaurant/features/splash/controllers/splash_controller.dart';
import 'package:stackfood_multivendor_restaurant/helper/route_helper.dart';
import 'package:uuid/uuid.dart';

class RestaurantController extends GetxController implements GetxService {
  final RestaurantServiceInterface restaurantServiceInterface;
  RestaurantController({required this.restaurantServiceInterface});

  List<Product>? _productList;
  List<Product>? get productList => _productList;

  List<ReviewModel>? _restaurantReviewList;
  List<ReviewModel>? get restaurantReviewList => _restaurantReviewList;

  List<ReviewModel>? _searchReviewList;
  List<ReviewModel>? get searchReviewList => _searchReviewList;

  List<ReviewModel>? _productReviewList;
  List<ReviewModel>? get productReviewList => _productReviewList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int? _pageSize;
  int? get pageSize => _pageSize;

  List<String> _offsetList = [];

  int _offset = 1;
  int get offset => _offset;

  int _discountTypeIndex = 0;
  int get discountTypeIndex => _discountTypeIndex;

  XFile? _pickedLogo;
  XFile? get pickedLogo => _pickedLogo;

  XFile? _pickedCover;
  XFile? get pickedCover => _pickedCover;

  int? _categoryIndex = 0;
  int? get categoryIndex => _categoryIndex;

  int? _subCategoryIndex = 0;
  int? get subCategoryIndex => _subCategoryIndex;

  List<int>? _selectedAddons;
  List<int>? get selectedAddons => _selectedAddons;

  List<VariantTypeModel>? _variantTypeList;
  List<VariantTypeModel>? get variantTypeList => _variantTypeList;

  bool _isAvailable = true;
  bool get isAvailable => _isAvailable;

  bool _isRecommended = true;
  bool get isRecommended => _isRecommended;

  List<Schedules>? _scheduleList;
  List<Schedules>? get scheduleList => _scheduleList;

  bool _scheduleLoading = false;
  bool get scheduleLoading => _scheduleLoading;

  bool? _isGstEnabled;
  bool? get isGstEnabled => _isGstEnabled;

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  bool _isVeg = false;
  bool get isVeg => _isVeg;

  bool? _isRestVeg = true;
  bool? get isRestVeg => _isRestVeg;

  bool? _isRestNonVeg = true;
  bool? get isRestNonVeg => _isRestNonVeg;

  String _type = 'all';
  String get type => _type;

  static final List<String> _productTypeList = ['all', 'veg', 'non_veg'];
  List<String> get productTypeList => _productTypeList;

  List<VariationModel>? _variationList;
  List<VariationModel>? get variationList => _variationList;

  List<String?> _tagList = [];
  List<String?> get tagList => _tagList;

  CuisineModel? _cuisineModel;
  CuisineModel? get cuisineModel => _cuisineModel;

  List<int>? _selectedCuisines;
  List<int>? get selectedCuisines => _selectedCuisines;

  List<int?>? _cuisineIds;
  List<int?>? get cuisineIds => _cuisineIds;

  Product? _product;
  Product? get product => _product;

  int _announcementStatus = 0;
  int get announcementStatus => _announcementStatus;

  bool instantOrder = false;
  bool scheduleOrder = false;

  int? _extraPackagingSelectedValue = 0;
  int? get extraPackagingSelectedValue => _extraPackagingSelectedValue;

  List<String?>? _characteristicSuggestionList;
  List<String?>? get characteristicSuggestionList =>
      _characteristicSuggestionList;

  List<int>? _selectedCharacteristics;
  List<int>? get selectedCharacteristics => _selectedCharacteristics;

  List<String?>? _selectedCharacteristicsList;
  List<String?>? get selectedCharacteristicsList =>
      _selectedCharacteristicsList;

  final List<String?> _stockTypeList = [
    'unlimited_stock',
    'limited_stock',
    'daily_stock'
  ];
  List<String?> get stockTypeList => _stockTypeList;

  int? _stockTypeIndex = 0;
  int? get stockTypeIndex => _stockTypeIndex;

  bool _stockTextFieldDisable = false;
  bool get stockTextFieldDisable => _stockTextFieldDisable;

  bool _isHalal = false;
  bool get isHalal => _isHalal;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  bool? _isExtraPackagingEnabled;
  bool? get isExtraPackagingEnabled => _isExtraPackagingEnabled;

  void initSetup() {
    _isHalal = false;
  }

  void initRestaurantData(Restaurant restaurant) {
    _pickedLogo = null;
    _pickedCover = null;
    _isGstEnabled = restaurant.gstStatus;
    _scheduleList = [];
    _scheduleList!.addAll(restaurant.schedules!);
    _isRestVeg = restaurant.veg == 1;
    _isRestNonVeg = restaurant.nonVeg == 1;
    _extraPackagingSelectedValue = restaurant.extraPackagingStatus;
    _getCuisineList(restaurant.cuisines);
    _getCharacteristicSuggestionList();
    _selectedCharacteristicsList = [];
    _selectedCharacteristicsList!.addAll(restaurant.characteristics!);
    _isExtraPackagingEnabled = restaurant.isExtraPackagingActive;
  }

  Future<void> _getCuisineList(List<Cuisine>? cuisines) async {
    _selectedCuisines = [];
    CuisineModel? cuisineModel =
        await restaurantServiceInterface.getCuisineList();
    if (cuisineModel != null) {
      _cuisineModel = cuisineModel;
      for (var modelCuisine in _cuisineModel!.cuisines!) {
        for (Cuisine cuisine in cuisines!) {
          if (modelCuisine.id == cuisine.id) {
            _selectedCuisines!
                .add(_cuisineModel!.cuisines!.indexOf(modelCuisine));
          }
        }
      }
    }
    update();
  }

  void setExtraPackagingSelectedValue(int value) {
    _extraPackagingSelectedValue = value;
    update();
  }

  Future<void> _getCharacteristicSuggestionList() async {
    _characteristicSuggestionList = [];
    _selectedCharacteristics = [];
    List<String?>? suggestionList =
        await restaurantServiceInterface.getCharacteristicSuggestionList();
    if (suggestionList != null) {
      _characteristicSuggestionList!.addAll(suggestionList);
      for (int index = 0;
          index < _characteristicSuggestionList!.length;
          index++) {
        _selectedCharacteristics!.add(index);
      }
    }
    update();
  }

  void setCharacteristics(String? name, {bool willUpdate = true}) {
    _selectedCharacteristicsList!.add(name);
    if (willUpdate) {
      update();
    }
  }

  void setTag(String? name, {bool willUpdate = true}) {
    _tagList.add(name);
    if (willUpdate) {
      update();
    }
  }

  void initializeTags() {
    _tagList = [];
  }

  void removeTag(int index) {
    _tagList.removeAt(index);
    update();
  }

  void setEmptyVariationList() {
    _variationList = [];
  }

  void setExistingVariation(List<Variation>? variationList) {
    _variationList = <VariationModel>[];
    // _variationList!
    //     .addAll(variationList?.map((e) => e.toVariationModel()) ?? []);
    _variationList!.addAll(_getVariationModel(variationList ?? []));
  }

  List<VariationModel> _getVariationModel(List<Variation> variationList,
      [String? parentOptionId]) {
    List<VariationModel> vList = [];
    // vList.addAll(variationList.map((e) => e.toVariationModel()));
    for (var variation in variationList) {
      List<Option> options = [];

      for (var option in variation.variationValues!) {
        options.add(
          Option(
            optionNameController: TextEditingController(text: option.level),
            optionPriceController:
                TextEditingController(text: option.optionPrice),
            optionStockController:
                TextEditingController(text: option.totalStock),
            optionId: option.optionId,
            child: [],
          ),
        );

        if (option.child?.isNotEmpty ?? false) {
          vList.addAll(_getVariationModel(option.child!, option.optionId));
        }
      }

      vList.add(VariationModel(
        id: variation.id,
        nameController: TextEditingController(text: variation.name),
        isSingle: variation.type == 'single' ? true : false,
        minController: TextEditingController(text: variation.min),
        maxController: TextEditingController(text: variation.max),
        required: variation.required == 'on' ? true : false,
        options: options,
        parentOptionId: parentOptionId,
      ));
    }
    return vList;
  }

  void changeSelectVariationType(int index, [String? parentOptionId]) {
    if (parentOptionId == null) {
      _variationList![index].isSingle = !_variationList![index].isSingle;
    } else {
      changeSelectVariationModelFromNested(
          _variationList ?? [], index, parentOptionId);
    }
    update();
  }

  void changeSelectVariationModelFromNested(
    List<VariationModel> variationIds,
    int index,
    String? targetOptionId,
  ) {
    for (var variation in variationIds) {
      // if (!variationIds.contains(variation.id)) continue;
      if (variation.options?.isNotEmpty ?? false) {
        for (var option in variation.options!) {
          if (option.optionId == targetOptionId) {
            option.child![index].isSingle = !option.child![index].isSingle;
            return;
          }
          if (option.child != null) {
            changeSelectVariationModelFromNested(
              option.child!,
              index,
              targetOptionId,
            );
          }
        }
      }
    }
  }

  void setVariationRequired(int index, [String? parentOptionId]) {
    if (parentOptionId == null) {
      _variationList![index].required = !_variationList![index].required;
    } else {
      setRequiredVariationModelFromNested(
          _variationList ?? [], index, parentOptionId);
    }
    update();
  }

  void setRequiredVariationModelFromNested(
    List<VariationModel> variationIds,
    int index,
    String? targetOptionId,
  ) {
    for (var variation in variationIds) {
      // if (!variationIds.contains(variation.id)) continue;
      if (variation.options?.isNotEmpty ?? false) {
        for (var option in variation.options!) {
          if (option.optionId == targetOptionId) {
            option.child![index].required = !option.child![index].required;
            return;
          }
          if (option.child != null) {
            setRequiredVariationModelFromNested(
              option.child!,
              index,
              targetOptionId,
            );
          }
        }
      }
    }
  }

  void addVariation([String? parentOptionId]) {
    final newVariationModel = VariationModel(
      id: const Uuid().v4(),
      nameController: TextEditingController(),
      required: false,
      isSingle: true,
      maxController: TextEditingController(),
      minController: TextEditingController(),
      parentOptionId: parentOptionId,
      options: [
        Option(
          optionId: "${const Uuid().v4()}_option",
          optionNameController: TextEditingController(),
          optionPriceController: TextEditingController(),
          optionStockController: TextEditingController(),
          child: [],
        )
      ],
    );
    if (parentOptionId != null) {
      debugPrint('parentOptionId: $parentOptionId');
      addVariationModelToNested(
        _variationList ?? [],
        newVariationModel,
        parentOptionId,
      );
    } else {
      _variationList!.add(newVariationModel);
    }
    update();
  }

  void addVariationModelToNested(
    List<VariationModel> variationIds,
    VariationModel variationModel,
    String? targetOptionId,
  ) {
    for (var variation in variationIds) {
      // if (!variationIds.contains(variation.id)) continue;
      if (variation.options != null) {
        for (var option in variation.options!) {
          debugPrint('option.optionId: ${option.optionId}');
          if (option.optionId == targetOptionId) {
            debugPrint('option.optionId: ${option.optionId}');
            option.child = option.child ?? [];
            option.child!.add(variationModel);
            return;
          }
          // Recursively search in the child VariationModels
          if (option.child != null) {
            addVariationModelToNested(
              option.child!,
              variationModel,
              targetOptionId,
            );
          }
        }
      }
    }
  }

  void removeVariation(int index, [String? parentOptionId]) {
    if (parentOptionId != null) {
      removeVariationModelFromNested(
          _variationList ?? [], index, parentOptionId);
    } else {
      _variationList!.removeAt(index);
    }
    update();
  }

  void removeVariationModelFromNested(
    List<VariationModel> variationIds,
    int index,
    String? targetOptionId,
  ) {
    for (var variation in variationIds) {
      // if (!variationIds.contains(variation.id)) continue;
      if (variation.options != null) {
        for (var option in variation.options!) {
          if (option.optionId == targetOptionId) {
            option.child?.removeAt(index);
          }
          if (option.child != null) {
            removeVariationModelFromNested(
              option.child!,
              index,
              targetOptionId,
            );
          }
        }
      }
    }
  }

  void addOptionVariation(int index, [String? parentVariationId]) {
    final option = Option(
      optionId: "${const Uuid().v4()}_option",
      optionNameController: TextEditingController(),
      optionPriceController: TextEditingController(),
      optionStockController: TextEditingController(),
      child: [],
    );
    if (parentVariationId != null) {
      addOptionVariationModelToNested(
        _variationList ?? [],
        option,
        parentVariationId,
      );
    } else {
      _variationList![index].options!.add(option);
    }
    update();
  }

  void addOptionVariationModelToNested(List<VariationModel> variationIds,
      Option newOption, String? targetVariationId) {
    for (var variation in variationIds) {
      // if (!variationIds.contains(variation.id)) continue;
      if (variation.id == targetVariationId) {
        variation.options!.add(newOption);
        return;
      } else {
        for (var option in variation.options!) {
          if (option.child?.isEmpty ?? true) continue;
          addOptionVariationModelToNested(
            option.child!,
            newOption,
            targetVariationId,
          );
        }
      }
    }
  }

  void removeOptionVariation(String vId, String oId) {
    removeOptionVariationModelFromNested(_variationList ?? [], oId, vId);
    update();
  }

  void removeOptionVariationModelFromNested(
      List<VariationModel> variationIds, String oId, String? vId) {
    for (var variation in variationIds) {
      // if (!variationIds.contains(variation.id)) continue;
      if (variation.id == vId) {
        variation.options!.removeWhere((e) => e.optionId == oId);
        return;
      } else {
        for (var option in variation.options!) {
          if (option.child != null) {
            removeOptionVariationModelFromNested(option.child!, oId, vId);
          }
        }
      }
    }
  }

  Future<void> getProductList(String offset, String type) async {
    if (offset == '1') {
      _offsetList = [];
      _offset = 1;
      _type = type;
      _productList = null;
      update();
    }
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);
      ProductModel? productModel =
          await restaurantServiceInterface.getProductList(offset, type);
      if (productModel != null) {
        if (offset == '1') {
          _productList = [];
        }
        _productList!.addAll(productModel.products!);
        _pageSize = productModel.totalSize;
        _isLoading = false;
        update();
      }
    } else {
      if (isLoading) {
        _isLoading = false;
        update();
      }
    }
  }

  void showBottomLoader() {
    _isLoading = true;
    update();
  }

  void setOffset(int offset) {
    _offset = offset;
  }

  void getAttributeList(Product? product) async {
    _discountTypeIndex = 0;
    _categoryIndex = 0;
    _subCategoryIndex = 0;
    _pickedLogo = null;
    _selectedAddons = [];
    _variantTypeList = [];
    List<int?> addonsIds = await Get.find<AddonController>().getAddonList();
    if (product != null && product.addOns != null) {
      for (int index = 0; index < product.addOns!.length; index++) {
        setSelectedAddonIndex(
            addonsIds.indexOf(product.addOns![index].id), false);
      }
    }
    await Get.find<CategoryController>().getCategoryList(product);
  }

  void setDiscountTypeIndex(int index, bool notify) {
    _discountTypeIndex = index;
    if (notify) {
      update();
    }
  }

  Future<void> updateRestaurant(Restaurant restaurant, List<String> cuisines,
      String token, List<Translation> translation) async {
    _isLoading = true;
    update();

    String characteristics = '';
    for (var element in _selectedCharacteristicsList!) {
      characteristics = characteristics +
          (characteristics.isEmpty ? '' : ',') +
          element!.replaceAll(' ', '');
    }

    bool isSuccess = await restaurantServiceInterface.updateRestaurant(
        restaurant,
        cuisines,
        _pickedLogo,
        _pickedCover,
        token,
        translation,
        characteristics);
    if (isSuccess) {
      Get.back();
      Get.find<ProfileController>().getProfile();
      showCustomSnackBar('restaurant_settings_updated_successfully'.tr,
          isError: false);
    }
    _isLoading = false;
    update();
  }

  void pickImage(bool isLogo, bool isRemove) async {
    if (isRemove) {
      _pickedLogo = null;
      _pickedCover = null;
    } else {
      if (isLogo) {
        _pickedLogo =
            await ImagePicker().pickImage(source: ImageSource.gallery);
      } else {
        _pickedCover =
            await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      update();
    }
  }

  void setSelectedAddonIndex(int index, bool notify) {
    if (!_selectedAddons!.contains(index)) {
      _selectedAddons!.add(index);
      if (notify) {
        update();
      }
    }
  }

  void removeAddon(int index) {
    _selectedAddons!.removeAt(index);
    update();
  }

  Future<void> addProduct(
      Product product,
      bool isAdd,
      List<int> deletedVariationIds,
      List<int> deletedVariationOptionIds) async {
    _isLoading = true;
    update();

    String tags = '';
    for (var element in _tagList) {
      tags = tags + (tags.isEmpty ? '' : ',') + element!.replaceAll(' ', '');
    }

    bool isSuccess = await restaurantServiceInterface.addProduct(
        product,
        _pickedLogo,
        isAdd,
        tags,
        deletedVariationIds,
        deletedVariationOptionIds);
    if (isSuccess) {
      Get.offAllNamed(RouteHelper.getInitialRoute());
      showCustomSnackBar(
          isAdd
              ? 'product_added_successfully'.tr
              : 'product_updated_successfully'.tr,
          isError: false);
      getProductList('1', 'all');
    }
    _isLoading = false;
    update();
  }

  Future<void> deleteProduct(int productID) async {
    _isLoading = true;
    update();
    bool isSuccess = await restaurantServiceInterface.deleteProduct(productID);
    if (isSuccess) {
      Get.back();
      showCustomSnackBar('product_deleted_successfully'.tr, isError: false);
      getProductList('1', 'all');
    }
    _isLoading = false;
    update();
  }

  Future<void> getRestaurantReviewList(int? restaurantID, String? searchText,
      {bool willUpdate = true}) async {
    if (searchText!.isEmpty) {
      _restaurantReviewList = null;
      _isSearching = false;
    } else {
      _searchReviewList = null;
      _isSearching = true;
    }
    if (willUpdate) {
      update();
    }
    _tabIndex = 0;
    List<ReviewModel>? restaurantReviewList = await restaurantServiceInterface
        .getRestaurantReviewList(restaurantID, searchText);

    if (restaurantReviewList != null) {
      if (searchText.isEmpty) {
        _restaurantReviewList = [];
        _restaurantReviewList!.addAll(restaurantReviewList);
      } else {
        _searchReviewList = [];
        _searchReviewList!.addAll(restaurantReviewList);
      }
    }
    update();
  }

  Future<void> getProductReviewList(int? productID) async {
    _productReviewList = null;
    List<ReviewModel>? productReviewList =
        await restaurantServiceInterface.getProductReviewList(productID);
    if (productReviewList != null) {
      _productReviewList = [];
      _productReviewList!.addAll(productReviewList);
    }
    update();
  }

  void setAvailability(bool isAvailable) {
    _isAvailable = isAvailable;
  }

  void toggleAvailable(int? productID) async {
    bool isSuccess = await restaurantServiceInterface.updateProductStatus(
        productID, _isAvailable ? 0 : 1);
    if (isSuccess) {
      getProductList('1', 'all');
      _isAvailable = !_isAvailable;
      showCustomSnackBar('food_status_updated_successfully'.tr, isError: false);
    }
    update();
  }

  void setRecommended(bool isRecommended) {
    _isRecommended = isRecommended;
  }

  void toggleRecommendedProduct(int? productID) async {
    bool isSuccess = await restaurantServiceInterface
        .updateRecommendedProductStatus(productID, _isRecommended ? 0 : 1);
    if (isSuccess) {
      getProductList('1', 'all');
      _isRecommended = !_isRecommended;
      showCustomSnackBar('food_status_updated_successfully'.tr, isError: false);
    }
    update();
  }

  void toggleGst() {
    _isGstEnabled = !_isGstEnabled!;
    update();
  }

  Future<void> addSchedule(Schedules schedule) async {
    schedule.openingTime = '${schedule.openingTime!}:00';
    schedule.closingTime = '${schedule.closingTime!}:00';
    _scheduleLoading = true;
    update();
    int? scheduleID = await restaurantServiceInterface.addSchedule(schedule);
    if (scheduleID != null) {
      schedule.id = scheduleID;
      _scheduleList!.add(schedule);
      Get.back();
      showCustomSnackBar('schedule_added_successfully'.tr, isError: false);
    }
    _scheduleLoading = false;
    update();
  }

  Future<void> deleteSchedule(int? scheduleID) async {
    _scheduleLoading = true;
    update();
    bool isSuccess =
        await restaurantServiceInterface.deleteSchedule(scheduleID);
    if (isSuccess) {
      _scheduleList!.removeWhere((schedule) => schedule.id == scheduleID);
      Get.back();
      showCustomSnackBar('schedule_removed_successfully'.tr, isError: false);
    }
    _scheduleLoading = false;
    update();
  }

  void setTabIndex(int index) {
    bool notify = true;
    if (_tabIndex == index) {
      notify = false;
    }
    _tabIndex = index;
    if (notify) {
      update();
    }
  }

  void setVeg(bool isVeg, bool notify) {
    _isVeg = isVeg;
    if (notify) {
      update();
    }
  }

  void setRestVeg(bool? isVeg, bool notify) {
    _isRestVeg = isVeg;
    if (notify) {
      update();
    }
  }

  void setRestNonVeg(bool? isNonVeg, bool notify) {
    _isRestNonVeg = isNonVeg;
    if (notify) {
      update();
    }
  }

  Future<Product?> getProductDetails(int productId) async {
    _isLoading = true;
    update();
    Product? product =
        await restaurantServiceInterface.getProductDetails(productId);
    if (product != null) {
      _product = product;
      if (_product?.translations == null || _product!.translations!.isEmpty) {
        _product!.translations = [];
        _product!.translations!.add(Translation(
          locale: Get.find<SplashController>().configModel!.language!.first.key,
          key: 'name',
          value: _product!.name,
        ));
        _product!.translations!.add(Translation(
          locale: Get.find<SplashController>().configModel!.language!.first.key,
          key: 'description',
          value: _product!.description,
        ));
      }
      _isLoading = false;
      update();
    }
    _isLoading = false;
    update();
    return _product;
  }

  Future<void> getCuisineList() async {
    _selectedCuisines = [];
    CuisineModel? cuisineModel =
        await restaurantServiceInterface.getCuisineList();
    if (cuisineModel != null) {
      _cuisineIds = [];
      _cuisineIds!.add(0);
      _cuisineModel = cuisineModel;
      for (var cuisine in _cuisineModel!.cuisines!) {
        _cuisineIds!.add(cuisine.id);
      }
    }
    update();
  }

  void setSelectedCuisineIndex(int index, bool notify) {
    if (!_selectedCuisines!.contains(index)) {
      _selectedCuisines!.add(index);
      if (notify) {
        update();
      }
    }
  }

  void removeCuisine(int index) {
    _selectedCuisines!.removeAt(index);
    update();
  }

  void setSelectedCharacteristicsIndex(int index, bool notify) {
    if (_selectedCharacteristics!.contains(index)) {
      _selectedCharacteristicsList!.add(_characteristicSuggestionList![index]);
      if (notify) {
        update();
      }
    }
  }

  void removeCharacteristic(int index) {
    _selectedCharacteristicsList!.removeAt(index);
    update();
  }

  Future<void> updateAnnouncement(int status, String announcement) async {
    _isLoading = true;
    update();
    bool isSuccess = await restaurantServiceInterface.updateAnnouncement(
        status, announcement);
    if (isSuccess) {
      Get.back();
      showCustomSnackBar('announcement_updated_successfully'.tr,
          isError: false);
      Get.find<ProfileController>().getProfile();
    }
    _isLoading = false;
    update();
  }

  void setAnnouncementStatus(int index) {
    _announcementStatus = index;
    update();
  }

  Future<void> updateReply(int reviewID, String reply) async {
    _isLoading = true;
    update();
    bool isSuccess =
        await restaurantServiceInterface.updateReply(reviewID, reply);
    if (isSuccess) {
      Get.back();
      showCustomSnackBar('reply_updated_successfully'.tr, isError: false);
      getRestaurantReviewList(
          Get.find<ProfileController>().profileModel!.restaurants![0].id, '');
    }
    _isLoading = false;
    update();
  }

  void setInstantOrder(bool value) {
    if (!checkWarning(value, scheduleOrder)) {
      instantOrder = value;
    }
    update();
  }

  void setOrderStatus(bool instant, bool schedule) {
    instantOrder = instant;
    scheduleOrder = schedule;
    update();
  }

  void setScheduleOrder(bool value) {
    if (!checkWarning(instantOrder, value)) {
      scheduleOrder = value;
    }
    update();
  }

  bool checkWarning(bool instantOrder, bool scheduleOrder) {
    if (!instantOrder && !scheduleOrder) {
      showCustomSnackBar(
          'can_not_disable_both_instance_order_and_schedule_order'.tr,
          isError: true);
    }
    return (!instantOrder && !scheduleOrder);
  }

  void setStockTypeIndex(int? index, bool notify) {
    _stockTypeIndex = index;
    if (notify) {
      update();
    }
  }

  void setStockFieldDisable(bool status, {bool notify = true}) {
    _stockTextFieldDisable = status;
    if (notify) {
      update();
    }
  }

  void toggleHalal({bool willUpdate = true}) {
    _isHalal = !_isHalal;
    if (willUpdate) {
      update();
    }
  }

  void toggleExtraPackaging() {
    _isExtraPackagingEnabled = !_isExtraPackagingEnabled!;
    update();
  }

  List<VariationModel> get flatVariationModelList {
    return _getFlatVariationModelList(_variationList ?? []);
  }

  List<VariationModel> _getFlatVariationModelList(
      List<VariationModel> variationList) {
    if (variationList.isEmpty) return [];
    return variationList.fold(
      [],
      (acc, e) {
        final childList = e.options?.fold(
            [],
            (childAcc, child) => [
                  ...childAcc,
                  ..._getFlatVariationModelList(child.child ?? [])
                ]);
        return [
          ...acc,
          ...[e],
          ...(childList ?? [])
        ];
      },
    );
  }
}
