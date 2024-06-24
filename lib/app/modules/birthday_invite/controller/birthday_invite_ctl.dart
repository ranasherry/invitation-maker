import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class BirthdayInviteController extends GetxController {
  //TODO: Implement InvitationMakerController

  final count = 0.obs;

  final groomNameTextController = TextEditingController();
  final brideNameTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final contactNoController = TextEditingController();

  DateTime dateTime = DateTime.now();
  GlobalKey shotKey = GlobalKey();

  RxInt selectedIndex = 0.obs;
  List<String> NetworkImages = [
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2011.png?alt=media&token=0741b55a-fc7c-4aac-9036-71a706cb6104",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2016.png?alt=media&token=4b5b1ed1-7957-49f5-b3d2-4e4e7f4b7d82",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2024.png?alt=media&token=6cdf8174-0028-4f27-898b-1f0613330bfc",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2017.png?alt=media&token=8157ef99-ee07-4727-a064-d398d165e55a",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FBlack%20Gold%20Simple%20Wedding%20Invitation%20(2)%201%201.png?alt=media&token=22b0b1e8-3889-4198-9ca8-b1f1750f2bd4",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2018.png?alt=media&token=58c18674-1330-4239-b55d-86d4b01f76c4",
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
    final groomName = groomNameTextController.text;
    final brideName = brideNameTextController.text;
    final contactNumber = contactNoController.text;

    if (groomName.isEmpty || brideName.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in all fields correctly.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else {
      isOnTemplates.value = true;
      AppLovinProvider.instance.showInterstitial(() {});

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
