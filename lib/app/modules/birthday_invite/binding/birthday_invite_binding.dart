import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/birthday_invite/controller/birthday_invite_ctl.dart';

class BirthdayInviteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BirthdayInviteController>(
      () => BirthdayInviteController(),
    );
  }
}
