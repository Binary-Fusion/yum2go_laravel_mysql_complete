import 'package:yum2go_v3_customer/features/home/domain/models/banner_model.dart';
import 'package:yum2go_v3_customer/features/home/domain/models/cashback_model.dart';

abstract class HomeServiceInterface {
  Future<BannerModel?> getBannerList();
  Future<List<CashBackModel>?> getCashBackOfferList();
  Future<CashBackModel?> getCashBackData(double amount);
}
