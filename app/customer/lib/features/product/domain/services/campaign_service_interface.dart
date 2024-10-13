import 'package:yum2go_v3_customer/common/models/product_model.dart';
import 'package:yum2go_v3_customer/features/product/domain/models/basic_campaign_model.dart';

abstract class CampaignServiceInterface {
  Future<List<BasicCampaignModel>?> getBasicCampaignList();
  Future<List<Product>?> getItemCampaignList();
  Future<BasicCampaignModel?> getCampaignDetails(String campaignID);
}
