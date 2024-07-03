import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/controller/home_view_ctl.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class GraduationPartyCTL extends GetxController {
  //TODO: Implement InvitationMakerController

  final count = 0.obs;

  final graduateNameTextController = TextEditingController();
  // final RSVPNameTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final contactNoController = TextEditingController();

  DateTime dateTime = DateTime.now();
  GlobalKey shotKey = GlobalKey();

  RxInt selectedIndex = 0.obs;
  List<String> NetworkImages = [
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20122.png?alt=media&token=baa53e6e-8b0b-4097-9f0d-d3d22cf59f07",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20125.png?alt=media&token=ac352351-aaea-4f80-9b47-1b26b3813770",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20124.png?alt=media&token=d656c2c1-b6bf-4055-a9ab-9f8a906144aa",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20130.png?alt=media&token=5a805861-9187-459e-b728-7e3439b008ce",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20138.png?alt=media&token=70c27513-70db-4ca9-a3bf-27c2482b4d3a",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20139.png?alt=media&token=f34d7dbc-aa09-4314-87b8-cb0ecbfc920b",
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
    final graduateName = graduateNameTextController.text;
    // final RSVPName = RSVPNameTextController.text;
    // final contactNumber = contactNoController.text;

    if (graduateName.isEmpty) {
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
