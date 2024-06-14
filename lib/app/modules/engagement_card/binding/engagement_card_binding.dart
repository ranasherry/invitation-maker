import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/engagement_card/controller/engagement_card_ctl.dart';

class engagementCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<engagementCardCTL>(
      () => engagementCardCTL(),
    );
  }
}
