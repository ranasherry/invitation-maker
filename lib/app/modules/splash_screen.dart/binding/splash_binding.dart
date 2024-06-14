import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/splash_screen.dart/controller/splash_screen_ctl.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
