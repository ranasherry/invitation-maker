import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/controller/anniversary_ctl.dart';

class AnniversaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnniversaryCTL>(
      () => AnniversaryCTL(),
    );
  }
}
