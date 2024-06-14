import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';

class WeddingInviteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeddingInviteController>(
      () => WeddingInviteController(),
    );
  }
}
