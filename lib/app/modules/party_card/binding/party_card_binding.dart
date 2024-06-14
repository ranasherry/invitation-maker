import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/party_card/controller/party_card_ctl.dart';

class partyCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<partyCardCTL>(
      () => partyCardCTL(),
    );
  }
}
