import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/controller/home_view_ctl.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class partyCardCTL extends GetxController {
  //TODO: Implement InvitationMakerController

  final count = 0.obs;

  final NameTextController = TextEditingController();
  final partyTypeTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final contactNoController = TextEditingController();

  DateTime dateTime = DateTime.now();
  GlobalKey shotKey = GlobalKey();

  RxInt selectedIndex = 0.obs;
  List<String> NetworkImages = [
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20154.png?alt=media&token=43b37d47-8644-4fd5-a6b1-7c76ec260410",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20155.png?alt=media&token=cc6c2084-b00c-45de-b63f-5cb839786d94",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20147.png?alt=media&token=4949da5b-7121-4bd2-b28d-c99d7621932e",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20156.png?alt=media&token=3e86c1dc-6509-44cf-be97-2ddb50b79bd4",
    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20157.png?alt=media&token=a38b52a1-b8df-4a31-a96c-fa4eddad34c5",
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
    final partyType = partyTypeTextController.text;

    final contactNumber = contactNoController.text;

    if (Name.isEmpty || partyType.isEmpty) {
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
