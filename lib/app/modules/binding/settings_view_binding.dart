import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/controller/settings_view_ctl.dart';

class SettingsViewbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsViewCTL());
  }
}
