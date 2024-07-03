import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/splash_screen.dart/controller/splash_screen_ctl.dart';
import 'package:invitation_maker/app/routes/app_pages.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';
import 'package:rive/rive.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  // Obtain shared preferences.
  bool? b;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // b = controller.isFirstTime;
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset(
            AppImages.splashrive,
            stateMachines: ['State Machine 1'],
            onInit: controller.onRiveInit,
          ),

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 80),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.HOMEVIEW);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.blockSizeVertical * 6,
                  width: SizeConfig.blockSizeHorizontal * 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFE5F3),
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 2)),
                  child: Text("Get Started",
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
          )

          // Align(
          //   alignment: Alignment.center,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       // verticalSpace(SizeConfig.blockSizeVertical * 5),
          //       Padding(
          //         padding:
          //             EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
          //         child: Text("Invitation Maker",
          //             style: TextStyle(
          //                 color: Theme.of(context).colorScheme.primary,
          //                 fontSize: SizeConfig.blockSizeHorizontal * 6,
          //                 fontWeight: FontWeight.bold)),
          //       ),
          //       verticalSpace(SizeConfig.blockSizeVertical * 1),
          //       Text("Share your invitations instantly with just a click",
          //           style: TextStyle(
          //               color: Theme.of(context).colorScheme.primary,
          //               fontSize: SizeConfig.blockSizeHorizontal * 3,
          //               fontWeight: FontWeight.bold)),
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Padding(
          //             padding: EdgeInsets.only(
          //                 top: SizeConfig.blockSizeVertical * 15,
          //                 right: SizeConfig.blockSizeHorizontal * 15,
          //                 left: SizeConfig.blockSizeHorizontal * 15),
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(
          //                     8.0), // Adjust the radius as per your requirement
          //                 color: Colors.white,
          //               ),
          //               child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(
          //                     10), // Same radius as the container
          //                 child: LinearProgressIndicator(
          //                     minHeight: 6,
          //                     backgroundColor: Colors.grey.shade100,
          //                     color: Color(0xFFFF8E00)),
          //               ),
          //             ))
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
