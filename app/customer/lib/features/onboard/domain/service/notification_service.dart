import 'package:yum2go_v3_customer/features/onboard/domain/models/onboarding_model.dart';
import 'package:yum2go_v3_customer/features/onboard/domain/repository/onboard_repository_interface.dart';
import 'package:yum2go_v3_customer/features/onboard/domain/service/onboard_service_interface.dart';

class OnboardService implements OnboardServiceInterface {
  final OnboardRepositoryInterface onboardRepositoryInterface;
  OnboardService({required this.onboardRepositoryInterface});

  @override
  Future<List<OnBoardingModel>> getOnBoardingList() async {
    return await onboardRepositoryInterface.getList();
  }
}
