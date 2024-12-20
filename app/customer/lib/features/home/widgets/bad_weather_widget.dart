import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/location/controllers/location_controller.dart';
import 'package:yum2go_v3_customer/features/location/domain/models/zone_response_model.dart';
import 'package:yum2go_v3_customer/helper/address_helper.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';
import 'package:yum2go_v3_customer/util/images.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

class BadWeatherWidget extends StatefulWidget {
  const BadWeatherWidget({super.key});

  @override
  State<BadWeatherWidget> createState() => _BadWeatherWidgetState();
}

class _BadWeatherWidgetState extends State<BadWeatherWidget> {
  bool _showAlert = true;
  String? _message;

  @override
  Widget build(BuildContext context) {
    return _showAlert && _message != null && _message!.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              color: Theme.of(context).primaryColor.withOpacity(0.7),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault,
                vertical: Dimensions.paddingSizeSmall),
            margin: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.isDesktop(context)
                    ? 0
                    : Dimensions.paddingSizeDefault,
                vertical: Dimensions.paddingSizeSmall),
            child: Row(
              children: [
                Image.asset(Images.weather, height: 50, width: 50),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Expanded(
                    child: Text(
                  _message!,
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Colors.white),
                )),
              ],
            ),
          )
        : const SizedBox();
  }

  @override
  void initState() {
    super.initState();

    _initCall();
  }

  _initCall() async {
    ZoneData? zoneData;
    await Get.find<LocationController>().getZone(
        AddressHelper.getAddressFromSharedPref()!.latitude,
        AddressHelper.getAddressFromSharedPref()!.longitude,
        false);

    for (var data in AddressHelper.getAddressFromSharedPref()!.zoneData!) {
      if (data.id == AddressHelper.getAddressFromSharedPref()!.zoneId) {
        if (data.increasedDeliveryFeeStatus == 1 &&
            data.increaseDeliveryFeeMessage != null) {
          zoneData = data;
        }
      }
    }

    if (zoneData != null) {
      _showAlert = zoneData.increasedDeliveryFeeStatus == 1;
      _message = zoneData.increaseDeliveryFeeMessage;
    } else {
      _showAlert = false;
    }
    if (mounted) {
      setState(() {});
    }
  }
}
