// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yum2go_v3_customer/common/widgets/custom_image_widget.dart';
import 'package:yum2go_v3_customer/common/widgets/hover_widgets/text_hover_widget.dart';
import 'package:yum2go_v3_customer/features/splash/controllers/splash_controller.dart';
import 'package:yum2go_v3_customer/features/splash/domain/models/config_model.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

import '../../helper/route_helper.dart';

class FooterViewWidget extends StatefulWidget {
  final Widget child;
  final double minHeight;
  final bool visibility;
  const FooterViewWidget(
      {super.key,
      required this.child,
      this.minHeight = 0.65,
      this.visibility = true});

  @override
  State<FooterViewWidget> createState() => _FooterViewWidgetState();
}

class _FooterViewWidgetState extends State<FooterViewWidget> {
  final TextEditingController _newsLetterController = TextEditingController();
  final Color _color = Colors.white;
  final ConfigModel? _config = Get.find<SplashController>().configModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              minHeight:
                  (widget.visibility && ResponsiveHelper.isDesktop(context))
                      ? MediaQuery.of(context).size.height * widget.minHeight
                      : MediaQuery.of(context).size.height * 0.7),
          child: Align(alignment: Alignment.topCenter, child: widget.child),
        ),
        (widget.visibility && ResponsiveHelper.isDesktop(context))
            ? const _FooterSection()
            // Container(
            //     color: const Color(0xFF414141),
            //     width: context.width,
            //     margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
            //     child: Center(
            //       child: Column(
            //         children: [
            //           SizedBox(
            //             width: Dimensions.webMaxWidth,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Expanded(
            //                     flex: 4,
            //                     child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           const SizedBox(
            //                               height:
            //                                   Dimensions.paddingSizeExtraLarge),
            //                           Row(children: [
            //                             // Image.asset(Images.logo, width: 60, height: 40),
            //                             Image.asset(Images.logoName,
            //                                 height: 40, width: 100),
            //                           ]),
            //                           const SizedBox(
            //                               height: Dimensions.paddingSizeSmall),
            //                           Text(
            //                               'subscribe_to_out_new_channel_to_get_latest_updates'
            //                                   .tr,
            //                               style: robotoRegular.copyWith(
            //                                   color: _color,
            //                                   fontSize:
            //                                       Dimensions.fontSizeSmall)),
            //                           const SizedBox(
            //                               height: Dimensions.paddingSizeSmall),
            //                           Container(
            //                             width: 300,
            //                             decoration: BoxDecoration(
            //                               color: Colors.white,
            //                               borderRadius: BorderRadius.circular(
            //                                   Dimensions.radiusDefault),
            //                               boxShadow: [
            //                                 BoxShadow(
            //                                     color: Colors.black
            //                                         .withOpacity(0.05),
            //                                     blurRadius: 2)
            //                               ],
            //                             ),
            //                             child: Row(children: [
            //                               const SizedBox(width: 20),
            //                               Expanded(
            //                                   child: TextField(
            //                                 controller: _newsLetterController,
            //                                 expands: false,
            //                                 style: robotoMedium.copyWith(
            //                                     color: Colors.black,
            //                                     fontSize: Dimensions
            //                                         .fontSizeExtraSmall),
            //                                 decoration: InputDecoration(
            //                                     hintText:
            //                                         'your_email_address'.tr,
            //                                     hintStyle:
            //                                         robotoRegular.copyWith(
            //                                             color: Colors.grey,
            //                                             fontSize: Dimensions
            //                                                 .fontSizeExtraSmall),
            //                                     border: InputBorder.none,
            //                                     isCollapsed: true),
            //                                 maxLines: 1,
            //                               )),
            //                               GetBuilder<SplashController>(
            //                                   builder: (splashController) {
            //                                 return InkWell(
            //                                   onTap: () {
            //                                     String email =
            //                                         _newsLetterController.text
            //                                             .trim()
            //                                             .toString();
            //                                     if (email.isEmpty) {
            //                                       showCustomSnackBar(
            //                                           'enter_email_address'.tr);
            //                                     } else if (!GetUtils.isEmail(
            //                                         email)) {
            //                                       showCustomSnackBar(
            //                                           'enter_a_valid_email_address'
            //                                               .tr);
            //                                     } else {
            //                                       Get.find<SplashController>()
            //                                           .subscribeMail(email)
            //                                           .then((value) {
            //                                         if (value) {
            //                                           _newsLetterController
            //                                               .clear();
            //                                         }
            //                                       });
            //                                     }
            //                                   },
            //                                   child: Container(
            //                                     margin:
            //                                         const EdgeInsets.symmetric(
            //                                             horizontal: 2,
            //                                             vertical: 2),
            //                                     decoration: BoxDecoration(
            //                                         color: Theme.of(context)
            //                                             .primaryColor,
            //                                         borderRadius: BorderRadius
            //                                             .circular(Dimensions
            //                                                 .radiusDefault)),
            //                                     padding:
            //                                         const EdgeInsets.symmetric(
            //                                             horizontal: 10,
            //                                             vertical: 5),
            //                                     child: !splashController
            //                                             .isLoading
            //                                         ? Text('subscribe'.tr,
            //                                             style: robotoRegular.copyWith(
            //                                                 color: Colors.white,
            //                                                 fontSize: Dimensions
            //                                                     .fontSizeExtraSmall))
            //                                         : const SizedBox(
            //                                             height: 15,
            //                                             width: 20,
            //                                             child:
            //                                                 CircularProgressIndicator(
            //                                                     color: Colors
            //                                                         .white)),
            //                                   ),
            //                                 );
            //                               }),
            //                             ]),
            //                           ),
            //                           GetBuilder<SplashController>(
            //                               builder: (splashController) {
            //                             return SizedBox(
            //                                 height: 50,
            //                                 child: ListView.builder(
            //                                   scrollDirection: Axis.horizontal,
            //                                   shrinkWrap: true,
            //                                   physics:
            //                                       const NeverScrollableScrollPhysics(),
            //                                   padding: EdgeInsets.zero,
            //                                   itemCount: splashController
            //                                       .configModel!
            //                                       .socialMedia!
            //                                       .length,
            //                                   itemBuilder: (context, index) {
            //                                     String? name = splashController
            //                                         .configModel!
            //                                         .socialMedia![index]
            //                                         .name;
            //                                     late String icon;
            //                                     if (name == 'facebook') {
            //                                       icon = Images.facebook;
            //                                     } else if (name == 'linkedin') {
            //                                       icon = Images.linkedin;
            //                                     } else if (name == 'youtube') {
            //                                       icon = Images.youtube;
            //                                     } else if (name == 'twitter') {
            //                                       icon = Images.twitter;
            //                                     } else if (name ==
            //                                         'instagram') {
            //                                       icon = Images.instagram;
            //                                     } else if (name ==
            //                                         'pinterest') {
            //                                       icon = Images.pinterest;
            //                                     }
            //                                     return Padding(
            //                                       padding: const EdgeInsets
            //                                           .symmetric(
            //                                           horizontal: Dimensions
            //                                               .paddingSizeExtraSmall),
            //                                       child: InkWell(
            //                                         onTap: () async {
            //                                           String url =
            //                                               splashController
            //                                                   .configModel!
            //                                                   .socialMedia![
            //                                                       index]
            //                                                   .link!;
            //                                           if (!url.startsWith(
            //                                               'https://')) {
            //                                             url = 'https://$url';
            //                                           }
            //                                           url = url.replaceFirst(
            //                                               'www.', '');
            //                                           if (await canLaunchUrlString(
            //                                               url)) {
            //                                             _launchURL(url);
            //                                           }
            //                                         },
            //                                         child: Image.asset(icon,
            //                                             height: 30,
            //                                             width: 30,
            //                                             fit: BoxFit.contain),
            //                                       ),
            //                                     );
            //                                   },
            //                                 ));
            //                           }),
            //                         ])),
            //                 Expanded(
            //                   flex: 8,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(
            //                         Dimensions.paddingSizeSmall),
            //                     child: Container(
            //                       padding: const EdgeInsets.all(
            //                           Dimensions.paddingSizeSmall),
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(
            //                             Dimensions.radiusSmall),
            //                         gradient: LinearGradient(
            //                             colors: [
            //                               Theme.of(context)
            //                                   .disabledColor
            //                                   .withOpacity(0.03),
            //                               Theme.of(context)
            //                                   .disabledColor
            //                                   .withOpacity(0.05),
            //                               Theme.of(context)
            //                                   .disabledColor
            //                                   .withOpacity(0.1),
            //                               Theme.of(context)
            //                                   .disabledColor
            //                                   .withOpacity(0.1),
            //                               Theme.of(context)
            //                                   .disabledColor
            //                                   .withOpacity(0.05),
            //                               Theme.of(context)
            //                                   .disabledColor
            //                                   .withOpacity(0.03),
            //                             ],
            //                             begin: Alignment.topCenter,
            //                             end: Alignment.bottomCenter),
            //                       ),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text('about'.tr,
            //                                   style: robotoBold.copyWith(
            //                                       color: _color,
            //                                       fontSize: Dimensions
            //                                           .fontSizeSmall)),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeLarge),

            //                               FooterButton(
            //                                   title: 'about_us'.tr,
            //                                   route: RouteHelper.getHtmlRoute(
            //                                       'about-us')),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),

            //                               // FooterButton(title: 'find_stores'.tr, route: RouteHelper.getAllRestaurantRoute('popular')),
            //                               // const SizedBox(height: Dimensions.paddingSizeSmall),

            //                               FooterButton(
            //                                   title: 'categories'.tr,
            //                                   route: RouteHelper
            //                                       .getCategoryRoute()),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                             ],
            //                           ),
            //                           Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text('quick_links'.tr,
            //                                   style: robotoBold.copyWith(
            //                                       color: _color,
            //                                       fontSize: Dimensions
            //                                           .fontSizeSmall)),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeLarge),
            //                               _config!.refundPolicyStatus == 1
            //                                   ? FooterButton(
            //                                       title: 'money_refund'.tr,
            //                                       route:
            //                                           RouteHelper.getHtmlRoute(
            //                                               'refund-policy'))
            //                                   : const SizedBox(),
            //                               SizedBox(
            //                                   height: _config
            //                                               .refundPolicyStatus ==
            //                                           1
            //                                       ? Dimensions.paddingSizeSmall
            //                                       : 0.0),
            //                               _config.shippingPolicyStatus == 1
            //                                   ? FooterButton(
            //                                       title: 'shipping'.tr,
            //                                       route:
            //                                           RouteHelper.getHtmlRoute(
            //                                               'shipping-policy'))
            //                                   : const SizedBox(),
            //                               SizedBox(
            //                                   height:
            //                                       _config.shippingPolicyStatus ==
            //                                               1
            //                                           ? Dimensions
            //                                               .paddingSizeSmall
            //                                           : 0.0),
            //                               FooterButton(
            //                                   title: 'cancellation_policy'.tr,
            //                                   route: RouteHelper.getHtmlRoute(
            //                                       'cancellation-policy')),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                               FooterButton(
            //                                   title: 'privacy_policy'.tr,
            //                                   route: RouteHelper.getHtmlRoute(
            //                                       'privacy-policy')),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                               FooterButton(
            //                                   title: 'terms_and_condition'.tr,
            //                                   route: RouteHelper.getHtmlRoute(
            //                                       'terms-and-condition')),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                             ],
            //                           ),
            //                           Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text('for_users'.tr,
            //                                   style: robotoBold.copyWith(
            //                                       color: _color,
            //                                       fontSize: Dimensions
            //                                           .fontSizeSmall)),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeLarge),
            //                               TextHoverWidget(builder: (hovered) {
            //                                 return InkWell(
            //                                   hoverColor: Colors.transparent,
            //                                   onTap: () {
            //                                     if (Get.find<AuthController>()
            //                                         .isLoggedIn()) {
            //                                       Get.toNamed(RouteHelper
            //                                           .getProfileRoute());
            //                                     } else {
            //                                       Get.dialog(const Center(
            //                                           child: AuthDialogWidget(
            //                                               exitFromApp: false,
            //                                               backFromThis: true)));
            //                                     }
            //                                   },
            //                                   child: Text(
            //                                       Get.find<AuthController>()
            //                                               .isLoggedIn()
            //                                           ? 'profile'.tr
            //                                           : 'login'.tr,
            //                                       style: hovered
            //                                           ? robotoMedium.copyWith(
            //                                               color:
            //                                                   Theme.of(context)
            //                                                       .primaryColor,
            //                                               fontSize: Dimensions
            //                                                   .fontSizeExtraSmall)
            //                                           : robotoRegular.copyWith(
            //                                               color: Theme.of(
            //                                                       context)
            //                                                   .disabledColor,
            //                                               fontSize: Dimensions
            //                                                   .fontSizeExtraSmall)),
            //                                 );
            //                               }),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                               FooterButton(
            //                                   title: 'live_chat'.tr,
            //                                   route: RouteHelper
            //                                       .getConversationRoute()),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                               FooterButton(
            //                                   title: 'my_orders'.tr,
            //                                   route:
            //                                       RouteHelper.getOrderRoute()),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                               FooterButton(
            //                                   title: 'help_support'.tr,
            //                                   route: RouteHelper
            //                                       .getSupportRoute()),
            //                               const SizedBox(
            //                                   height:
            //                                       Dimensions.paddingSizeSmall),
            //                             ],
            //                           ),
            //                           (_config.appUrlAndroid != null ||
            //                                   _config.appUrlIos != null)
            //                               ? Column(
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.start,
            //                                   children: [
            //                                     Text('get_app'.tr,
            //                                         style: robotoBold.copyWith(
            //                                             color: _color,
            //                                             fontSize: Dimensions
            //                                                 .fontSizeSmall)),
            //                                     const SizedBox(
            //                                         height: Dimensions
            //                                             .paddingSizeLarge),
            //                                     _config.appUrlAndroid != null
            //                                         ? InkWell(
            //                                             onTap: () => _launchURL(
            //                                                 _config.appUrlAndroid ??
            //                                                     ''),
            //                                             child: Padding(
            //                                               padding: const EdgeInsets
            //                                                   .symmetric(
            //                                                   vertical: Dimensions
            //                                                       .paddingSizeExtraSmall),
            //                                               child: Image.asset(
            //                                                   Images
            //                                                       .landingGooglePlay,
            //                                                   height: 40,
            //                                                   fit: BoxFit
            //                                                       .contain),
            //                                             ),
            //                                           )
            //                                         : const SizedBox(),
            //                                     _config.appUrlIos != null
            //                                         ? InkWell(
            //                                             onTap: () => _launchURL(
            //                                                 _config.appUrlIos ??
            //                                                     ''),
            //                                             child: Padding(
            //                                               padding: const EdgeInsets
            //                                                   .symmetric(
            //                                                   vertical: Dimensions
            //                                                       .paddingSizeExtraSmall),
            //                                               child: Image.asset(
            //                                                   Images
            //                                                       .landingAppStore,
            //                                                   height: 40,
            //                                                   fit: BoxFit
            //                                                       .contain),
            //                                             ),
            //                                           )
            //                                         : const SizedBox(),
            //                                   ],
            //                                 )
            //                               : const SizedBox(),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Divider(
            //             thickness: 0.5,
            //             color: Theme.of(context).disabledColor,
            //             indent: 0,
            //             height: 0,
            //           ),
            //           Container(
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: Dimensions.paddingSizeExtraSmall),
            //             color: const Color(0xFF343434),
            //             child: Center(
            //               child: SizedBox(
            //                 width: Dimensions.webMaxWidth,
            //                 child: Center(
            //                   child: Padding(
            //                     padding:
            //                         const EdgeInsets.symmetric(vertical: 8.0),
            //                     child: Text(
            //                       '© ${_config.footerText ?? ''}',
            //                       style: robotoRegular.copyWith(
            //                           color: _color,
            //                           fontSize: Dimensions.fontSizeExtraSmall,
            //                           fontWeight: FontWeight.w100),
            //                     ),
            //                   ),
            //                 ),
            //                 // child: Row(
            //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 //   children: [
            //                 //     // Text(
            //                 //     //   '© ${_config!.footerText ?? ''}',
            //                 //     //   style: robotoRegular.copyWith(color: _color, fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.w100),
            //                 //     // ),
            //                 //
            //                 //     // GetBuilder<LocalizationController>(builder: (localizationController) {
            //                 //     //   int index0 = 0;
            //                 //     //   List<DropdownMenuItem<int>> languageList = [];
            //                 //     //   for(int index = 0; index<AppConstants.languages.length; index++) {
            //                 //     //     languageList.add(DropdownMenuItem(
            //                 //     //       value: index,
            //                 //     //       child: TextHover(builder: (hovered) {
            //                 //     //         return Row(children: [
            //                 //     //           Image.asset(AppConstants.languages[index].imageUrl!, height: 20, width: 20, color: Colors.white,),
            //                 //     //           const SizedBox(width: Dimensions.paddingSizeExtraSmall),
            //                 //     //           Text(AppConstants.languages[index].languageName!, style: robotoRegular.copyWith(color: hovered ? Colors.black : Colors.white)),
            //                 //     //         ]);
            //                 //     //       }),
            //                 //     //     ));
            //                 //     //     if(AppConstants.languages[index].languageCode == localizationController.locale.languageCode) {
            //                 //     //       index0 = index;
            //                 //     //     }
            //                 //     //   }
            //                 //     //   return DropdownButton<int>(
            //                 //     //     value: index0,
            //                 //     //     items: languageList,
            //                 //     //     dropdownColor: const Color(0xFF414141),
            //                 //     //     // dropdownColor: Theme.of(context).colorScheme.background,
            //                 //     //     icon: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
            //                 //     //     elevation: 0, iconSize: 30, underline: const SizedBox(),
            //                 //     //     onChanged: (int? index) {
            //                 //     //       localizationController.setLanguage(Locale(AppConstants.languages[index!].languageCode!, AppConstants.languages[index].countryCode));
            //                 //     //     },
            //                 //     //   );
            //                 //     // }),
            //                 //
            //                 //   ],
            //                 // ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   )
            : const SizedBox.shrink(),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.fromBorderSide(
          BorderSide(
            color: Theme.of(context).disabledColor,
            width: 1,
          ),
        ),
      ),
      width: MediaQuery.sizeOf(context).width,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: SizedBox(
        width: Dimensions.webMaxWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: Dimensions.webMaxWidth - 160,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: [
                  _SiteMap(),
                  _AppButtons(),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Copyrights © 2024 Yum2Go All rights reserved.',
                        style: robotoRegular.copyWith(
                          fontSize: 12.5,
                          color: const Color(0xff767676),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          _TextButton(
                            title: 'Terms of Use',
                            onTap: () {
                              launchUrlString(
                                'https://yum2go.com/terms-and-conditions',
                              );
                            },
                            color: const Color(0xff767676),
                            size: 12,
                          ),
                          Text(
                            '  /  ',
                            style: robotoRegular.copyWith(
                              fontSize: 12,
                              color: const Color(0xff767676),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          _TextButton(
                            title: 'Privacy Policy',
                            onTap: () {
                              launchUrlString(
                                'https://yum2go.com/privacy-policy',
                              );
                            },
                            color: const Color(0xff767676),
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _ImageButton(
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/300px-Facebook_icon_2013.svg.png',
                  onTap: () {
                    launchUrlString("https://www.facebook.com/yum2goapp/");
                  },
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                _ImageButton(
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png',
                  onTap: () {
                    launchUrlString('https://twitter.com/yum2goapp');
                  },
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                _ImageButton(
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/480px-Instagram_logo_2016.svg.png',
                  onTap: () {
                    launchUrlString('https://www.instagram.com/yum2goapp/');
                  },
                  height: 25,
                  width: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SiteMap extends StatelessWidget {
  const _SiteMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sitemap',
          style: robotoBold.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _TextButton(
            title: 'About Us',
            onTap: () {
              launchUrlString('https://yum2go.com/about-us');
            }),
        const SizedBox(
          height: 5,
        ),
        _TextButton(
            title: 'Restaurants',
            onTap: () {
              Get.toNamed(RouteHelper.getAllRestaurantRoute('latest'));
            }),
        const SizedBox(
          height: 5,
        ),
        _TextButton(
            title: 'Careers',
            onTap: () {
              launchUrlString('https://yum2go.com/careers');
            }),
      ],
    );
  }
}

class _AppButtons extends StatelessWidget {
  const _AppButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Download The App',
          style: robotoBold.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _ImageButton(
          imageUrl: 'https://yum2go.com/public/assets/images/logo/apple.png',
          onTap: () {
            launchUrlString(
                'https://apps.apple.com/us/app/yum2go-customer/id6476611154?platform=iphone');
          },
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageButton(
          imageUrl: 'https://yum2go.com/public/assets/images/logo/google.png',
          onTap: () {
            launchUrlString(
                'https://play.google.com/store/apps/details?id=com.yum2go.market&hl=en&gl=US');
          },
        ),
      ],
    );
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.size,
  });

  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: robotoRegular.copyWith(
          fontSize: size ?? 13,
          color: color ?? Theme.of(context).textTheme.headlineMedium!.color,
        ),
      ),
    );
  }
}

class _ImageButton extends StatelessWidget {
  const _ImageButton({
    super.key,
    required this.imageUrl,
    required this.onTap,
    this.height,
    this.width,
  });

  final String imageUrl;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomImageWidget(
        image: imageUrl,
        width: width ?? 170,
        height: height ?? 50.28,
        fit: BoxFit.contain,
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  final String title;
  final String route;
  final bool url;
  const FooterButton(
      {super.key, required this.title, required this.route, this.url = false});

  @override
  Widget build(BuildContext context) {
    return TextHoverWidget(builder: (hovered) {
      return InkWell(
        hoverColor: Colors.transparent,
        onTap: route.isNotEmpty
            ? () async {
                if (url) {
                  if (await canLaunchUrlString(route)) {
                    launchUrlString(route,
                        mode: LaunchMode.externalApplication);
                  }
                } else {
                  Get.toNamed(route);
                }
              }
            : null,
        child: Text(title,
            style: hovered
                ? robotoMedium.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: Dimensions.fontSizeExtraSmall)
                : robotoRegular.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: Dimensions.fontSizeExtraSmall)),
      );
    });
  }
}
