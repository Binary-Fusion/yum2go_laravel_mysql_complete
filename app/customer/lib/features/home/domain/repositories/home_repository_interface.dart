import 'package:yum2go_v3_customer/features/home/domain/models/cashback_model.dart';
import 'package:yum2go_v3_customer/interface/repository_interface.dart';

abstract class HomeRepositoryInterface extends RepositoryInterface {
  Future<List<CashBackModel>?> getCashBackOfferList();
  Future<CashBackModel?> getCashBackData(double amount);
}
