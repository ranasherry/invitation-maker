import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/utills/size_config.dart';
import 'package:lottie/lottie.dart';

class GraduationAnnouncementHome extends StatelessWidget {
  const GraduationAnnouncementHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Graduation Announcement Card Maker',
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 6,
              fontWeight: FontWeight.bold),
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
              // if (controller.isOnTemplates.value) {
              //   controller.isOnTemplates.value = false;
              // } else {
              // HomeViewCTL homeViewCtl = Get.find();
              // homeViewCtl.incrementFeedbackCount();
              print("Back");
              Get.back();
              // }
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
              child:
                  Lottie.asset("assets/lottie/Animation - 1719396558110.json"),
            ),
          )
        ],
      ),
    );
  }
}
