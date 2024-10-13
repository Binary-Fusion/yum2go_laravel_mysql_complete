import 'package:yum2go_v3_customer/common/models/response_model.dart';
import 'package:yum2go_v3_customer/features/profile/domain/models/userinfo_model.dart';
import 'package:yum2go_v3_customer/interface/repository_interface.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepositoryInterface extends RepositoryInterface {
  Future<ResponseModel> updateProfile(
      UserInfoModel userInfoModel, XFile? data, String token);
  Future<ResponseModel> changePassword(UserInfoModel userInfoModel);
}
