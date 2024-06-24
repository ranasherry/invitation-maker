import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/baby_shower/controller/baby_shower_card_ctl.dart';

class babyShowerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BabyShowerCTL>(
      () => BabyShowerCTL(),
    );
  }
}
