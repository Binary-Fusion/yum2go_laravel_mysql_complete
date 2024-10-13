// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:stackfood_multivendor_restaurant/util/app_constants.dart';

class RiskDiscloserData {
  final String? restaurantId;
  final String legalBusinessName;
  final String dbaBusinessName;
  final String businessContactName;
  final String businessContactEmail;
  final String businessContactTelephone;
  final String printedName;
  final String businessTitle;
  final String businessAddress;
  final File? imageFile;

  RiskDiscloserData({
    this.restaurantId,
    required this.legalBusinessName,
    required this.dbaBusinessName,
    required this.businessContactName,
    required this.businessContactEmail,
    required this.businessContactTelephone,
    required this.printedName,
    required this.businessTitle,
    this.businessAddress =
        '8668 West Spring Mountain Rd., Suite 110, Las Vegas, NV 89117',
    this.imageFile,
  });

  factory RiskDiscloserData.fromJson(Map<String, dynamic> json) {
    return RiskDiscloserData(
      restaurantId: json['restaurant_id'],
      legalBusinessName: json['legal_business_name'],
      dbaBusinessName: json['dba_business_name'],
      businessContactName: json['business_contact_name'],
      businessContactEmail: json['business_contact_email'],
      businessContactTelephone: json['business_contact_telephone'],
      printedName: json['printed_name'],
      businessTitle: json['business_title'],
      businessAddress: json['business_address'],
    );
  }

  Future<MultipartRequest> toFormData() async {
    var uri = Uri.parse('${AppConstants.baseUrl}${AppConstants.merchantUri}');
    var request = http.MultipartRequest('POST', uri)
      ..fields['restaurant_id'] = restaurantId ?? ''
      ..fields['legal_business_name'] = legalBusinessName
      ..fields['dba_business_name'] = dbaBusinessName
      ..fields['business_contact_name'] = businessContactName
      ..fields['business_contact_email'] = businessContactEmail
      ..fields['business_contact_telephone'] = businessContactTelephone
      ..fields['printed_name'] = printedName
      ..fields['business_title'] = businessTitle
      ..fields['business_address'] = businessAddress
      ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

    return request;
  }

  // to json except image
  Map<String, String> toJson() {
    return {
      'restaurant_id': restaurantId ?? '',
      'legal_business_name': legalBusinessName,
      'dba_business_name': dbaBusinessName,
      'business_contact_name': businessContactName,
      'business_contact_email': businessContactEmail,
      'business_contact_telephone': businessContactTelephone,
      'printed_name': printedName,
      'business_title': businessTitle,
      'business_address': businessAddress,
    };
  }

  RiskDiscloserData copyWith({
    String? restaurantId,
    String? legalBusinessName,
    String? dbaBusinessName,
    String? businessContactName,
    String? businessContactEmail,
    String? businessContactTelephone,
    String? printedName,
    String? businessTitle,
    String? businessAddress,
    File? imageFile,
  }) {
    return RiskDiscloserData(
      restaurantId: restaurantId ?? this.restaurantId,
      legalBusinessName: legalBusinessName ?? this.legalBusinessName,
      dbaBusinessName: dbaBusinessName ?? this.dbaBusinessName,
      businessContactName: businessContactName ?? this.businessContactName,
      businessContactEmail: businessContactEmail ?? this.businessContactEmail,
      businessContactTelephone:
          businessContactTelephone ?? this.businessContactTelephone,
      printedName: printedName ?? this.printedName,
      businessTitle: businessTitle ?? this.businessTitle,
      businessAddress: businessAddress ?? this.businessAddress,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}
