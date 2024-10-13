import 'package:yum2go_v3_customer/common/models/response_model.dart';
import 'package:yum2go_v3_customer/features/profile/domain/models/userinfo_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileServiceInterface {
  Future<UserInfoModel?> getUserInfo();
  Future<ResponseModel> updateProfile(
      UserInfoModel userInfoModel, XFile? data, String token);
  Future<ResponseModel> changePassword(UserInfoModel userInfoModel);
  Future<XFile?> pickImageFromGallery();
  Future<Response> deleteUser();
}
