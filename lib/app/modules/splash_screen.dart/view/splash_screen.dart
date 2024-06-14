import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/splash_screen.dart/controller/splash_screen_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  // Obtain shared preferences.
  bool? b;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // b = controller.isFirstTime;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
// gradient: LinearGradient(
//                   colors: [Color(0xFF303E3D), Color(0xFF232626)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter)
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 20,
                    left: SizeConfig.blockSizeHorizontal * 19),
                child: Image.asset(
                  AppImages.splash,
                  // AppImages.splash,
                  width: SizeConfig.blockSizeHorizontal * 60,
                  height: SizeConfig.blockSizeVertical * 30,
                  // fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // verticalSpace(SizeConfig.blockSizeVertical * 5),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 15),
                      child: Text("Invitation Maker",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: SizeConfig.blockSizeHorizontal * 6,
                              fontWeight: FontWeight.bold)),
                    ),
                    verticalSpace(SizeConfig.blockSizeVertical * 1),
                    Text("Share your invitations instantly with just a click",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: SizeConfig.blockSizeHorizontal * 3,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 15,
                              right: SizeConfig.blockSizeHorizontal * 15,
                              left: SizeConfig.blockSizeHorizontal * 15),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the radius as per your requirement
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10), // Same radius as the container
                              child: LinearProgressIndicator(
                                  minHeight: 6,
                                  backgroundColor: Colors.grey.shade100,
                                  color: Color(0xFFFF8E00)),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
