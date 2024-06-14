import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/graduation_party/controller/graduation_party_ctl.dart';

class GraduationPartyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraduationPartyCTL>(
      () => GraduationPartyCTL(),
    );
  }
}
