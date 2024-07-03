import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:invitation_maker/app/modules/controller/settings_view_ctl.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:invitation_maker/app/utills/app_strings.dart';
import 'package:invitation_maker/app/utills/size_config.dart';
import 'package:launch_review/launch_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends GetView<SettingsViewCTL> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      // Color(0xFFE7EBFA),
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.background,
        // Color(0xFFE7EBFA),
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 6,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        // bottom: PreferredSize(
        //     child: Container(
        //       margin: EdgeInsets.only(
        //           right: SizeConfig.blockSizeHorizontal * 3,
        //           left: SizeConfig.blockSizeHorizontal * 3),
        //       color: Theme.of(context).colorScheme.primary,
        //       height: 1.5,
        //     ),
        //     preferredSize: Size.fromHeight(6.0)),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Container(
        child: Column(
          children: [
            verticalSpace(SizeConfig.blockSizeVertical * 1),
            AppLovinProvider.instance.ShowBannerWidget(),
            // Container(
            //   // height: 60,
            //   // color: Colors.amber,
            //   child: Center(
            //       child: Obx(() => RevenueCatService()
            //                   .currentEntitlement
            //                   .value ==
            //               Entitlement.paid
            //           ? Container()
            //           : MaxAdView(
            //               adUnitId: Platform.isAndroid
            //                   ? AppStrings.MAX_BANNER_ID
            //                   : AppStrings.IOS_MAX_BANNER_ID,
            //               adFormat: AdFormat.banner,
            //               listener: AdViewAdListener(onAdLoadedCallback: (ad) {
            //                 print('Banner widget ad loaded from ' +
            //                     ad.networkName);
            //               }, onAdLoadFailedCallback: (adUnitId, error) {
            //                 print(
            //                     'Banner widget ad failed to load with error code ' +
            //                         error.code.toString() +
            //                         ' and message: ' +
            //                         error.message);
            //               }, onAdClickedCallback: (ad) {
            //                 print('Banner widget ad clicked');
            //               }, onAdExpandedCallback: (ad) {
            //                 print('Banner widget ad expanded');
            //               }, onAdCollapsedCallback: (ad) {
            //                 print('Banner widget ad collapsed');
            //               })))),
            // ),
            verticalSpace(SizeConfig.blockSizeVertical),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 7,
                  right: SizeConfig.blockSizeHorizontal * 4),
              child: Row(
                children: [
                  Icon(
                      controller.isDarkMode.value
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: Theme.of(context).colorScheme.onPrimary),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Theme Mode",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 5,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      Text(
                        "Light / Dark Theme",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 3,
                            color: Colors.pink.shade300),
                      )
                    ],
                  ),
                  Spacer(),
                  Obx(
                    () => Switch(
                      value: !controller.isDarkMode.value,
                      onChanged: (value) {
                        print("Is dark mode:  ${Get.isDarkMode}");
                        Get.changeThemeMode(
                            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                        controller.isDarkMode.value = Get.isDarkMode;
                      },
                      activeColor: Theme.of(context).colorScheme.onSecondary,
                      inactiveThumbColor: Colors.black,
                      activeTrackColor: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                bool isReviewed = pref.getBool("isReviewed") ?? false;
                final _inAppReview = InAppReview.instance;
                if (isReviewed) {
                  Get.snackbar("Thanks",
                      "The submission of your review has already been completed.",
                      snackStyle: SnackStyle.FLOATING,
                      backgroundColor: Colors.white,
                      colorText: Colors.black);
                } else {
                  if (await _inAppReview.isAvailable()) {
                    print('request actual review from store');
                    _inAppReview.requestReview();
                  } else {
                    print('open actual store listing');
                    // TODO: use your own store ids
                    _inAppReview.openStoreListing(
                      appStoreId: 'com.invitationmaker.wedding.birthday.card',
                      // microsoftStoreId: '<your microsoft store id>',
                    );

                    pref.setBool("isReviewed", true);
                  }
                }
              },
              child: settings_btn(
                  "Rate Us",
                  CupertinoIcons.hand_thumbsup_fill,
                  "Help us to grow with your 5 star",
                  Theme.of(context).colorScheme.onPrimary,
                  context),
            ),
            GestureDetector(
              onTap: () {
                controller.ShareApp();
              },
              child: settings_btn(
                  "Invite your friends",
                  Icons.person_add_alt_1,
                  "Spread the World",
                  Theme.of(context).colorScheme.onPrimary,
                  context),
            ),
            // GestureDetector(
            //     onTap: () {
            //       controller
            //           .openURL("https://sites.google.com/view/appgeniusx/home");
            //     },
            //     child: settings_btn("Privacy Policy", Icons.privacy_tip,
            //         "Rights of user", Theme.of(context).colorScheme.primary)),
            verticalSpace(SizeConfig.blockSizeVertical * 2),
            Container(
              child: Center(
                child: MaxAdView(
                    adUnitId: AppStrings.MAX_MREC_ID,
                    adFormat: AdFormat.mrec,
                    listener: AdViewAdListener(onAdLoadedCallback: (ad) {
                      print('mrec widget ad loaded from ' + ad.networkName);
                    }, onAdLoadFailedCallback: (adUnitId, error) {
                      print('mrec widget ad failed to load with error code ' +
                          error.code.toString() +
                          ' and message: ' +
                          error.message);
                    }, onAdClickedCallback: (ad) {
                      print('mrec widget ad clicked');
                    }, onAdExpandedCallback: (ad) {
                      print('mrec widget ad expanded');
                    }, onAdCollapsedCallback: (ad) {
                      print('mrec widget ad collapsed');
                    })),
              ),
            ),
            // Obx(() => RevenueCatService().currentEntitlement.value ==
            //         Entitlement.paid
            //     ? Container()
            //     : MaxAdView(
            //         adUnitId: Platform.isAndroid
            //             ? AppStrings.MAX_Mrec_ID
            //             : AppStrings.IOS_MAX_MREC_ID,
            //         adFormat: AdFormat.mrec,
            //         listener: AdViewAdListener(onAdLoadedCallback: (ad) {
            //           FirebaseAnalytics.instance.logAdImpression(
            //             adFormat: "Mrec",
            //             adSource: ad.networkName,
            //             value: ad.revenue,
            //           );
            //           print('Mrec widget ad loaded from ' + ad.networkName);
            //         }, onAdLoadFailedCallback: (adUnitId, error) {
            //           print('Mrec widget ad failed to load with error code ' +
            //               error.code.toString() +
            //               ' and message: ' +
            //               error.message);
            //         }, onAdClickedCallback: (ad) {
            //           print('Mrec widget ad clicked');
            //         }, onAdExpandedCallback: (ad) {
            //           print('Mrec widget ad expanded');
            //         }, onAdCollapsedCallback: (ad) {
            //           print('Mrec widget ad collapsed');
            //         }))),
            // verticalSpace(SizeConfig.blockSizeVertical),
          ],
        ),
      ),
    );
  }

  Padding settings_btn(String text1, IconData icon1, String text2, Color color,
      BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 4,
          left: SizeConfig.blockSizeHorizontal * 7,
          right: SizeConfig.blockSizeHorizontal * 5),
      child: Row(
        children: [
          Icon(
            icon1,
            color: Theme.of(context).colorScheme.onPrimary,
            size: SizeConfig.blockSizeHorizontal * 7,
          ),
          horizontalSpace(SizeConfig.blockSizeHorizontal * 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontWeight: FontWeight.bold,
                    color: color),
              ),
              Text(
                text2,
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                    color: Theme.of(context).colorScheme.onSecondary),
              )
            ],
          ),
        ],
      ),
    );
  }
}
