import 'package:stackfood_multivendor_restaurant/common/widgets/confirmation_dialog_widget.dart';
import 'package:stackfood_multivendor_restaurant/common/widgets/custom_app_bar_widget.dart';
import 'package:stackfood_multivendor_restaurant/common/widgets/custom_button_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/splash/controllers/splash_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/business/controllers/business_controller.dart';
import 'package:stackfood_multivendor_restaurant/features/business/domain/models/package_model.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/base_card_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/payment_cart_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/payment_method_bottom_sheet_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/registration_stepper_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/business_subscription_card_widget.dart';
import 'package:stackfood_multivendor_restaurant/features/business/widgets/success_widget.dart';
import 'package:stackfood_multivendor_restaurant/helper/color_coverter_helper.dart';
import 'package:stackfood_multivendor_restaurant/helper/route_helper.dart';
import 'package:stackfood_multivendor_restaurant/util/dimensions.dart';
import 'package:stackfood_multivendor_restaurant/util/images.dart';
import 'package:stackfood_multivendor_restaurant/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

import '../widgets/registration_stepper.dart';

class NewRegisteredUserPaymentScreen extends StatefulWidget {
  final int? restaurantId;
  final String? paymentId;
  const NewRegisteredUserPaymentScreen(
      {super.key, required this.restaurantId, this.paymentId});

  @override
  State<NewRegisteredUserPaymentScreen> createState() => _NewRegisteredUserPaymentScreenState();
}

class _NewRegisteredUserPaymentScreenState extends State<NewRegisteredUserPaymentScreen> {
  final bool _canBack = false;

  @override
  void initState() {
    super.initState();
    Get.find<BusinessController>().resetBusiness();
    Get.find<BusinessController>().changeDigitalPaymentName(null, canUpdate: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessController>(builder: (businessController) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (_canBack) {
            return;
          } else {
            _showBackPressedDialogue('your_business_plan_not_setup_yet'.tr);
          }
        },
        child: Scaffold(
          appBar: CustomAppBarWidget(
              title: 'registration_fee'.tr,
              isBackButtonExist: widget.paymentId != null),
          body: Scrollbar(
            child: Center(
              child: Container(
                width: context.width > 700 ? 700 : context.width,
                padding: context.width > 700
                    ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
                    : null,
                child: businessController.businessPlanStatus == 'complete'
                    ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          businessController.businessIndex == 1 ? StepperWidget(status: businessController.businessPlanStatus) : const SizedBox(height: Dimensions.paddingSizeLarge),
                          SizedBox(height: context.height * 0.2),

                          Image.asset(Images.checked, height: 90,width: 90),
                          const SizedBox(height: Dimensions.paddingSizeLarge),

                          Text('congratulations'.tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeOverLarge)),
                          const SizedBox(height: Dimensions.paddingSizeSmall),

                          Text(
                            'Your Registration Has been Completed Successfully.',
                            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall), textAlign: TextAlign.center, softWrap: true,
                          ),
                        ]
                      ),
                    )
                    : Column(children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(children: [
                              businessController.businessPlanStatus != 'payment'
                                  ? Column(children: [
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeExtraLarge),
                                      Column(children: [
                                              businessController.businessIndex == 1 ? StepperWidget(status: businessController.businessPlanStatus) : const SizedBox(height: Dimensions.paddingSizeLarge),
                                              SizedBox(
                                                      height: 600,
                                                      child: Stack(
                                                          clipBehavior:
                                                          Clip.none,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                              BoxDecoration(
                                                                color:
                                                                Theme.of(context).cardColor,
                                                                borderRadius:
                                                                BorderRadius.circular(Dimensions.radiusExtraLarge),
                                                                boxShadow: [
                                                                  BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, spreadRadius: 1, blurRadius: 10)
                                                                ],
                                                              ),
                                                              padding: const EdgeInsets
                                                                  .all(
                                                                  Dimensions.paddingSizeExtraSmall),
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                  top: Dimensions.paddingSizeLarge,
                                                                  bottom: Dimensions.paddingSizeExtraSmall, left: 48, right: 48),
                                                              child: BusinessSubscriptionCardWidget(
                                                                  index: 0,
                                                                  businessController: businessController,
                                                                  package: Packages(
                                                                    id:0,
                                                                    packageName: "Sign Up Fees",
                                                                    price:100,
                                                                    validity:30,
                                                                    maxOrder:"1",
                                                                    maxProduct:"1",
                                                                    pos:1,
                                                                    mobileApp:1,
                                                                    chat:1,
                                                                    review:1,
                                                                    selfDelivery:1,
                                                                    status:1,
                                                                    def:0,
                                                                    createdAt: DateTime.now().toString(),
                                                                    updatedAt: DateTime.now().toString(),
                                                                    color: '#ED9C24',
                                                                  ),
                                                                  color: const Color(0xffED9C24),
                                                                content: 'registration_fee_message'.tr,
                                                              ),
                                                            ),
                                                            businessController.activeSubscriptionIndex ==
                                                                0
                                                                ? Positioned(
                                                              top: 5,
                                                              right: 48,
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  color: Color(0xFFED9C24),
                                                                  border: Border.all(color: Theme.of(context).cardColor, width: 2),
                                                                ),
                                                                child: Icon(Icons.check, color: Theme.of(context).cardColor),
                                                              ),
                                                            )
                                                                : const SizedBox(),
                                                          ])
                                                    ),
                                              const SizedBox(
                                                  height: Dimensions
                                                      .paddingSizeLarge),
                                            ]),
                                    ])
                                  : Padding(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeLarge),
                                      child: Column(children: [
                                        Get.find<SplashController>()
                                                        .configModel!
                                                        .freeTrialPeriodStatus ==
                                                    1 &&
                                                widget.paymentId == null
                                            ? PaymentCartWidget(
                                                title:
                                                    '${'continue_with'.tr} ${Get.find<SplashController>().configModel!.freeTrialPeriodDay} ${'days_free_trial'.tr}',
                                                index: 0,
                                                onTap: () {
                                                  businessController
                                                      .setPaymentIndex(0);
                                                },
                                              )
                                            : const SizedBox(),
                                        const SizedBox(
                                            height: Dimensions
                                                .paddingSizeExtraLarge),
                                        PaymentCartWidget(
                                          title: businessController
                                                      .digitalPaymentName !=
                                                  null
                                              ? businessController
                                                          .digitalPaymentName!
                                                          .toString().trim().toLowerCase() ==
                                                      'stripe'
                                                  ? 'Credit/Debit Card'
                                                  : businessController
                                                      .digitalPaymentName!
                                                      .toString()
                                                      .replaceAll('_', ' ')
                                              : 'pay_online'.tr,
                                          index: 1,
                                          onTap: () {
                                            businessController
                                                .setPaymentIndex(1);
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              useRootNavigator: true,
                                              context: Get.context!,
                                              backgroundColor: Colors.white,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      Dimensions
                                                          .radiusExtraLarge),
                                                  topRight: Radius.circular(
                                                      Dimensions
                                                          .radiusExtraLarge),
                                                ),
                                              ),
                                              builder: (context) {
                                                return ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxHeight:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.8),
                                                  child:
                                                      const PaymentMethodBottomSheetWidget(),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ]),
                                    ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeLarge,
                              vertical: Dimensions.paddingSizeSmall),
                          child: Row(children: [
                            (businessController.businessPlanStatus ==
                                        'payment' &&
                                    widget.paymentId == null)
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if (businessController
                                                .businessPlanStatus !=
                                            'payment') {
                                          _showBackPressedDialogue(
                                              'your_business_plan_not_setup_yet'
                                                  .tr);
                                        } else {
                                          businessController
                                              .setBusinessStatus('business');
                                          businessController
                                              .changeDigitalPaymentName(null);
                                          if (businessController.isFirstTime ==
                                              false) {
                                            businessController.isFirstTime =
                                                true;
                                          }
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical:
                                                Dimensions.paddingSizeSmall),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons
                                                  .keyboard_double_arrow_left),
                                              const SizedBox(
                                                  width: Dimensions
                                                      .paddingSizeExtraSmall),
                                              Text(
                                                "back".tr,
                                                style: robotoRegular.copyWith(
                                                    fontSize: Dimensions
                                                        .fontSizeLarge),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                                width: (businessController.businessPlanStatus ==
                                        'payment')
                                    ? Dimensions.paddingSizeExtraSmall
                                    : 0),
                            Expanded(
                                    child: CustomButtonWidget(
                                    buttonText: 'next'.tr,
                                    onPressed: () =>
                                        businessController.getRegistrationFeeUrl(widget.restaurantId.toString()),
                                  )),
                          ]),
                        ),
                      ]),
              ),
            ),
          ),
        ),
      );
    });
  }

  void _showBackPressedDialogue(String title) {
    Future.delayed(Duration.zero, () {
      Get.dialog(
          ConfirmationDialogWidget(
            icon: Images.support,
            title: title,
            description: 'are_you_sure_to_go_back'.tr,
            isLogOut: true,
            onYesPressed: () => Get.offAllNamed(RouteHelper.getSignInRoute()),
          ),
          useSafeArea: false);
    });
  }
}

class StepperWidget extends StatelessWidget {
  final String status;
  const StepperWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {

    int state = 0;

    if(status == 'business') {
      state = 1;
    }else if(status == 'payment') {
      state = 2;
    }else if(status == 'complete') {
      state = 3;
    }

    return Row(children: [

      RegistrationStepper(
        title: 'general_information'.tr, isActive: true, haveLeftBar: false, haveRightBar: true, rightActive: true, onGoing: state == 0,
        fieldColor: const Color(0xFFED9C24),
      ),

      RegistrationStepper(
        title: 'registration_fee'.tr, isActive: state > 1, haveLeftBar: true, haveRightBar: true, rightActive: state > 1, onGoing: state == 1, processing: state != 3 && state != 0,
        fieldColor: const Color(0xFFED9C24),
      ),

      RegistrationStepper(
        title: 'complete'.tr, isActive: state == 3, haveLeftBar: true, haveRightBar: false, rightActive: state == 3,
        fieldColor: const Color(0xFFED9C24),
      ),

    ]);
  }
}