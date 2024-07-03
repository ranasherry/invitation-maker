import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SettingsViewCTL extends GetxController {
  RxBool isDarkMode = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  ShareApp() {
    Share.share(
        "Consider downloading this exceptional app, available on the Google Play Store at the following link: https://play.google.com/store/apps/details?id=com.invitationmaker.wedding.birthday.card");
  }

  // Future openURL(ur) async {
  //   final Uri _url = Uri.parse(ur);
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }
}
