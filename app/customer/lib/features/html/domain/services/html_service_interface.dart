import 'package:yum2go_v3_customer/features/html/enums/html_type.dart';

abstract class HtmlServiceInterface {
  Future<String?> getHtmlText(HtmlType htmlType, String languageCode);
}
