import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/birthday_invite/controller/birthday_invite_ctl.dart';
import 'package:invitation_maker/app/utills/size_config.dart';
import 'package:lottie/lottie.dart';

class BirthdayInviteHome extends GetView<BirthdayInviteController> {
  const BirthdayInviteHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          if (controller.isOnTemplates.value) {
            controller.isOnTemplates.value = false;
          } else {
            print("Back");
            Get.back();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Obx(
              () => Text(
                controller.isOnTemplates.value
                    ? 'Birthday Cards'
                    : 'Birthday Card Maker',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.bold),
              ),
            ),
            centerTitle: true,
            // bottom: PreferredSize(
            //     child: Container(
            //       margin: EdgeInsets.only(
            //           right: SizeConfig.blockSizeHorizontal * 3,
            //           left: SizeConfig.blockSizeHorizontal * 3),
            //       color: Theme.of(context).colorScheme.primary,
            //       height: 1.5,
            //     ),
            //     preferredSize: Size.fromHeight(6.0)),
            leading: GestureDetector(
                onTap: () {
                  if (controller.isOnTemplates.value) {
                    controller.isOnTemplates.value = false;
                  } else {
                    // HomeViewCTL homeViewCtl = Get.find();
                    // homeViewCtl.incrementFeedbackCount();
                    print("Back");
                    Get.back();
                  }
                  // Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: SizeConfig.blockSizeVertical * 30,
                  width: SizeConfig.blockSizeHorizontal * 60,
                  child: Lottie.asset(
                      "assets/lottie/Animation - 1719396558110.json"),
                ),
              )
            ],
          ),
        ));
  }
}
