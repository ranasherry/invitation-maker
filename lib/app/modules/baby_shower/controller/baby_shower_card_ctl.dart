import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class BabyShowerCTL extends GetxController {
  //TODO: Implement InvitationMakerController

  final count = 0.obs;

  final NameTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final contactNoController = TextEditingController();

  DateTime dateTime = DateTime.now();
  GlobalKey shotKey = GlobalKey();

  RxInt selectedIndex = 0.obs;
  List<String> NetworkImages = [
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20231%202.png?alt=media&token=f3ff3e62-f0db-4cbb-a3d2-ade705c476cc",
    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/babyShower%2FGroup%20242.png?alt=media&token=8ef09d41-5bcc-4a4e-8977-4bf4640fd08c",
    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/babyShower%2FGroup%20243.png?alt=media&token=154e6a80-2a16-46a5-95cd-ec3590b2d39b",
    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/babyShower%2FGroup%20249.png?alt=media&token=ff28e799-59eb-4c94-a97f-fdf592dfd447",
    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/babyShower%2FGroup%20250.png?alt=media&token=4197b0c5-2850-4229-a98c-0c784b3c3ab9",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20159.png?alt=media&token=ee758988-8491-4515-964a-65c2b1cc4df8",
  ];

  //? All Bool Entities Below
  RxBool isOnTemplates = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onNext() {
    final Name = NameTextController.text;

    final contactNumber = contactNoController.text;

    if (Name.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in all fields correctly.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else {
      isOnTemplates.value = true;
      AppLovinProvider.instance.showInterstitial(() {});
    }

    // Handle successful form submission (replace with your desired action)
  }

  void saveCard() async {
    WidgetShotRenderRepaintBoundary repaintBoundary = shotKey.currentContext!
        .findRenderObject() as WidgetShotRenderRepaintBoundary;
    var resultImage = await repaintBoundary.screenshot(
        // backgroundColor: Colors.amberAccent,
        format: ShotFormat.png,
        pixelRatio: 1);

    try {
      /// 存储的文件的路径
      String path = (await getTemporaryDirectory()).path;
      path += '/${DateTime.now().toString()}.png';
      File file = File(path);
      if (!file.existsSync()) {
        file.createSync();
      }
      await file.writeAsBytes(resultImage!);
      debugPrint("result = ${file.path}");

      Share.shareXFiles(
        [
          XFile(file.path)
          // XFile.fromData(
          //   resultImage,
          //   name: 'WeddingInvitation.ppt',
          //   lastModified: DateTime.now(),
          //   length: resultImage.length,
          // )
        ],
        // text: 'Presentation',
      );
    } catch (error) {
      /// flutter保存图片到App内存文件夹出错
      debugPrint("error = ${error}");
    }
  }
}
