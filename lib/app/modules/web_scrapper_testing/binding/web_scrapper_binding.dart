import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/web_scrapper_testing/controller/web_scapper_ctl.dart';

class WebScrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScraperController());
  }
}
