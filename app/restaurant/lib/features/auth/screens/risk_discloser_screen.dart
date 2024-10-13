import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stackfood_multivendor_restaurant/features/auth/controllers/auth_controller.dart';

import '../../../helper/dialog/dialog_helper.dart';
import '../data/contract_data.dart';
import '../domain/models/risk_discloser_data.dart';

class RiskDisclosurePage extends StatefulWidget {
  const RiskDisclosurePage({
    super.key,
    required this.data,
  });

  final RiskDiscloserData data;

  @override
  State<RiskDisclosurePage> createState() => _RiskDisclosurePageState();
}

class _RiskDisclosurePageState extends State<RiskDisclosurePage> {
  TextEditingController businessName = TextEditingController();
  GlobalKey businessNameKey = GlobalKey();
  TextEditingController dbaBusinessName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  ValueNotifier<bool> termsCheck = ValueNotifier(false);
  ValueNotifier<bool> floatingVisibility = ValueNotifier(true);
  String content = '';
  ScrollController scrollController = ScrollController();

  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget drawSignature() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Please draw your Signature'.tr,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ))
                    ],
                  ),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12),
                          clipBehavior: Clip.antiAlias,
                          constraints: const BoxConstraints.expand(),
                          child: HandSignature(
                            control: control,
                            color: Colors.blueGrey,
                            type: SignatureDrawType.shape,
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black12, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: () {
                                control.clear();
                              },
                              iconSize: 24,
                              icon: const Icon(FontAwesomeIcons.trash),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (control.lines.isNotEmpty) {
                        uploadUserSignatureAndData();
                      } else {
                        showAlertDialog(
                          context,
                          'Failed'.tr,
                          "Please draw your signature".tr,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBackgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      elevation: 5,
                    ),
                    child: Center(
                      child: Text(
                        'Submit Signature'.tr,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            height: 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // loadAsset(context);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent - scrollController.offset >=
              100 &&
          !floatingVisibility.value) {
        floatingVisibility.value = true;
      } else if (scrollController.position.maxScrollExtent -
                  scrollController.offset <
              100 &&
          floatingVisibility.value) {
        floatingVisibility.value = false;
      }
    });
    businessName.text = widget.data.legalBusinessName;
    dbaBusinessName.text = widget.data.dbaBusinessName;
    address.text = widget.data.businessAddress;
    contactName.text = widget.data.businessContactName;
    email.text = widget.data.businessContactEmail;
    telephone.text = widget.data.businessContactTelephone;
    super.initState();
  }

  // Future loadAsset(BuildContext context) async {
  //   content =
  //       await DefaultAssetBundle.of(context).loadString(Assets.html.policy);
  //   setState(() {});
  // }

  Future<File> saveByteDataToFile(ByteData byteData, String fileName) async {
    // Convert ByteData to Uint8List
    Uint8List uint8List = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    // Get the application documents directory
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/$fileName';

    // Create a file at the specified path
    File file = File(filePath);

    // Write the Uint8List to the file
    await file.writeAsBytes(uint8List);

    log('File saved at $filePath');
    return file;
  }

  Widget textField({
    required final TextEditingController controller,
    required final String hint,
    required final FormFieldSetter? onSaved,
    Key? key,
    bool? autofocus,
    List<TextInputFormatter> formatters = const [],
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        key: key,
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.done,
        inputFormatters: formatters,
        onSaved: onSaved,
        autofocus: autofocus ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        style: const TextStyle(fontSize: 18.0),
        cursorColor: Theme.of(context).primaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hint is required!';
          }
          return null;
        },
        decoration: InputDecoration(
            // contentPadding:
            //     new EdgeInsets.only(left: 8, right: 8),
            labelText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            counterText: '',
            hintText: hint,
            errorStyle: const TextStyle(),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }

  Future uploadUserSignatureAndData() async {
    ByteData? byteData = await control.toImage();
    File file = await saveByteDataToFile(
        byteData!, "${businessName.text.replaceAll(" ", "_")}.png");

    final data = RiskDiscloserData(
      restaurantId: widget.data.restaurantId!.toString(),
      legalBusinessName: businessName.text,
      dbaBusinessName: dbaBusinessName.text,
      businessContactName: contactName.text,
      businessContactEmail: email.text,
      businessContactTelephone: telephone.text,
      businessAddress: address.text,
      imageFile: file,
      businessTitle: businessName.text,
      printedName: businessName.text,
    );

    return Get.find<AuthController>().registerRiskDiscloser(data);

    // user.signatureUrl = imageUrl;
    // user.businessName = businessName.text;
    // user.dbaBusinessName = dbaBusinessName.text;
    // user.address = address.text;
    // user.contactName = contactName.text;
    // user.businessEmail = email.text;
    // user.telephone = telephone.text;
    // await FireStoreUtils.updateCurrentUser(user);
    // await hideProgress();
    // pushAndRemoveUntil(context, ContainerScreen(user: user), false);
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy Policy'.tr,
                        style: const TextStyle(fontSize: 28, height: 1),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Accept the terms to continue'.tr,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(
                            bottom: MediaQuery.of(context).padding.bottom),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "YUM2GO BUSINESS SIGN-UP AGREEMENT".tr,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Merchant Information".tr,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              textField(
                                controller: businessName,
                                hint: 'Legal Business Name',
                                key: businessNameKey,
                                autofocus: true,
                                onSaved: (t) {},
                              ),
                              textField(
                                controller: dbaBusinessName,
                                hint: '(DBA) Business Name',
                                onSaved: (t) {},
                              ),
                              textField(
                                controller: address,
                                hint: 'Address',
                                onSaved: (t) {},
                              ),
                              textField(
                                controller: contactName,
                                hint: 'Owner Name',
                                onSaved: (t) {},
                              ),
                              textField(
                                controller: email,
                                hint: 'Email',
                                onSaved: (t) {},
                              ),
                              textField(
                                  controller: telephone,
                                  hint: 'Telephone',
                                  onSaved: (t) {},
                                  formatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9.]'),
                                    ),
                                  ],
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  )),
                              const SizedBox(
                                height: 16,
                              ),
                              HtmlWidget(
                                ContractData.getData(widget.data),
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ValueListenableBuilder<bool>(
                                  valueListenable: termsCheck,
                                  builder: (context, value, child) {
                                    return ElevatedButton(
                                      onPressed: value
                                          ? () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return drawSignature();
                                                    });
                                              } else {
                                                Scrollable.ensureVisible(
                                                    businessNameKey
                                                        .currentContext!);
                                              }
                                            }
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: value
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        disabledBackgroundColor: Colors.grey,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        alignment: Alignment.center,
                                        elevation: 5,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Continue'.tr,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              height: 1),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ValueListenableBuilder<bool>(
                                      valueListenable: termsCheck,
                                      builder: (context, value, child) {
                                        return SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Checkbox(
                                                value: value,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                onChanged: (v) {
                                                  termsCheck.value = v!;
                                                }),
                                          ),
                                        );
                                      }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'By clicking Continue, you acknowledge that you have read and understood our Privacy Policy',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            if (Get.find<AuthController>().isLoading)
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: Container(
                  color: Colors.black.withOpacity(.2),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: floatingVisibility,
          builder: (context, value, child) {
            return Visibility(
              visible: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    scrollController
                        .animateTo(scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut)
                        .then((value) {
                      floatingVisibility.value = false;
                    });
                  },
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    // dispose all text editing controllers
    businessName.dispose();
    dbaBusinessName.dispose();
    address.dispose();
    contactName.dispose();
    email.dispose();
    telephone.dispose();
    super.dispose();
  }
}
