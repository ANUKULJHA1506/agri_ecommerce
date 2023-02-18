import 'package:agri_ecommerce/authentication_repo.dart';
import 'package:agri_ecommerce/homepage.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const home_page()) : Get.back();
  }
}
