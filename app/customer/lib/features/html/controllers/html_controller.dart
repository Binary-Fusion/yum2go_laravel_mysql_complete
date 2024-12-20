import 'package:yum2go_v3_customer/features/language/controllers/localization_controller.dart';
import 'package:yum2go_v3_customer/features/html/domain/services/html_service_interface.dart';
import 'package:yum2go_v3_customer/features/html/enums/html_type.dart';
import 'package:get/get.dart';

class HtmlController extends GetxController implements GetxService {
  final HtmlServiceInterface htmlServiceInterface;

  HtmlController({required this.htmlServiceInterface});

  String? _htmlText;
  String? get htmlText => _htmlText;

  Future<void> getHtmlText(HtmlType htmlType) async {
    _htmlText = await htmlServiceInterface.getHtmlText(
        htmlType, Get.find<LocalizationController>().locale.languageCode);
    update();
  }
}
