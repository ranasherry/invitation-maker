import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class AnniversaryCTL extends GetxController {
  //TODO: Implement InvitationMakerController

  final count = 0.obs;

  final husbandNameTextController = TextEditingController();
  final wifeNameTextController = TextEditingController();
  final marriagedateTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final contactNoController = TextEditingController();

  DateTime dateTime = DateTime.now();
  GlobalKey shotKey = GlobalKey();

  RxInt selectedIndex = 0.obs;
  List<String> NetworkImages = [
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20141.png?alt=media&token=1adf9a1f-e136-4abb-afd4-a2e959e6fea4",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20142.png?alt=media&token=cf266124-9d2e-4d06-a0f0-31e90cf54723",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20143.png?alt=media&token=68502e6b-1ad5-4c88-9cae-6f51801b1928",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20140.png?alt=media&token=1c9d2437-0648-49f3-bfd8-2039e93d2da3",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20144.png?alt=media&token=d888a2be-67e3-42d7-aa36-da1ac3e594c4",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20145.png?alt=media&token=9dbc0d6d-8b60-4e57-b5a5-bdfff02f4702",
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
    final husbandName = husbandNameTextController.text;
    final wifeName = wifeNameTextController.text;
    final marriagedate = marriagedateTextController.text;
    final contactNumber = contactNoController.text;

    if (husbandName.isEmpty || wifeName.isEmpty || marriagedate.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in all fields correctly.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else {
      isOnTemplates.value = true;
      AppLovinProvider.instance.showInterstitial((){});

      // Get.snackbar(
      //   'Success!',
      //   'Wedding invitation details submitted.',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
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
