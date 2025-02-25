import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:invitation_maker/app/routes/app_pages.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  late final StateMachineController? controller;
  //TODO: Implement HomeControlle
  bool isFirstTime = true;
  final prefs = SharedPreferences.getInstance();
  // AppLovin_CTL appLovin_CTL = Get.find();
  // GoogleAdsCTL googleAdsCT=Get.find();

  var tabIndex = 0.obs;
  Rx<int> percent = 0.obs;
  Rx<bool> isLoaded = false.obs;
  @override
  void onInit() async {
    super.onInit();
    AppLovinProvider.instance.init();
    // MetaAdsProvider.instance.initialize();

    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      int n = Random().nextInt(10) + 5;
      percent.value += n;
      if (percent.value >= 100) {
        percent.value = 100;
        // checkPermission();/
        checkFirstTime();

        // isLoaded.value = true;

        timer!.cancel();
      }
    });

    // checkplatform();
  }

  void onRiveInit(Artboard artboard) {
    controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller!);
    }
  }

  void disposeRiveController() {
    // Implement any specific cleanup here, such as removing the controller from the artboard
    if (controller != null) {
      controller!.dispose();
    }
  }

  // checkPermission() async {

  //      PermissionStatus status = await Permission.manageExternalStorage.status;
  //     if (status == PermissionStatus.granted) {
  //     print("Storage Granted");
  //     Future.delayed(Duration(seconds: 3),(){
  //     Get.offNamed(Routes.HomeView);
  //     });
  //   }
  //   else{
  //     print("Storage Not Granted");
  //     Future.delayed(Duration(seconds: 3),(){
  //     Get.offNamed(Routes.PDF_PERMISSION);
  //     });
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    disposeRiveController();
  }

  void setFirstTime(bool bool) {
    prefs.then((SharedPreferences pref) {
      pref.setBool('first_time', bool);
      print("Is First Time: $isFirstTime");
    });
  }

  void checkFirstTime() {
    prefs.then((SharedPreferences pref) {
      isFirstTime = pref.getBool('first_time') ?? true;

      print("Is First Time from Init: $isFirstTime");
      if (isFirstTime) {
        Get.toNamed(Routes.SPLASHSCREEN);
      } else {
        Get.offNamed(Routes.SPLASHSCREEN);
      }
    });
  }
}
