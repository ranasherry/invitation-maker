import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/controller/home_view_ctl.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewCTL());
  }
}
