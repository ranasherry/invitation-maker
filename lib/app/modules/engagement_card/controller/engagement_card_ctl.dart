import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class engagementCardCTL extends GetxController {
  //TODO: Implement InvitationMakerController

  final count = 0.obs;

  final maleFianceNameTextController = TextEditingController();
  final femaleFianceNameTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final contactNoController = TextEditingController();

  DateTime dateTime = DateTime.now();
  GlobalKey shotKey = GlobalKey();

  RxInt selectedIndex = 0.obs;
  List<String> NetworkImages = [
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20169.png?alt=media&token=c4d13de9-94ff-4c56-bb36-16581bd89eca",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20160.png?alt=media&token=a6ab485e-851f-4f04-8fcd-af3b77f87731",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20170.png?alt=media&token=3514adc0-6e21-4c13-ab9f-0f0c826d07cf",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20163.png?alt=media&token=f4100122-ec12-473c-a1b1-cea58b538214",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20171.png?alt=media&token=60a7a110-2ecf-45f6-89d1-e6ff76c91180",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20172.png?alt=media&token=c9a2029c-a774-4df7-9476-04822b083eb8",
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
    final maleFiance = maleFianceNameTextController.text;
    final femaleFiance = femaleFianceNameTextController.text;

    final contactNumber = contactNoController.text;

    if (maleFiance.isEmpty || femaleFiance.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in all fields correctly.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else {
      isOnTemplates.value = true;
      Get.snackbar(
        'Success!',
        'Wedding invitation details submitted.',
        snackPosition: SnackPosition.BOTTOM,
      );
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
