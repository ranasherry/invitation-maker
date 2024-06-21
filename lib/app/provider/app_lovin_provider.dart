import 'dart:io';
import 'dart:math';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/utills/app_strings.dart';

class AppLovinProvider {
  AppLovinProvider._privateConstructor();

  static final AppLovinProvider instance =
      AppLovinProvider._privateConstructor();

  final String _sdk_key = AppStrings.MAX_SDK;

  final String _interstitial_ad_unit_id = AppStrings.MAX_INTER_ID;
  // final String _rewarded_ad_unit_id = "ANDROID_REWARDED_AD_UNIT_ID";
  final String _banner_ad_unit_id = AppStrings.MAX_BANNER_ID;
  // final String _mrec_ad_unit_id = AppStrings.MAX_MREC_ID;

  // Create states
  RxBool isInitialized = false.obs;
  var interstitialLoadState = AdLoadState.notLoaded;
  var interstitialRetryAttempt = 0;
  var rewardedAdLoadState = AdLoadState.notLoaded;
  var rewardedAdRetryAttempt = 0;
  var isProgrammaticBannerCreated = false;
  var isProgrammaticBannerShowing = false;
  var isWidgetBannerShowing = false;
  var isProgrammaticMRecCreated = false;
  var isProgrammaticMRecShowing = false;
  var isWidgetMRecShowing = false;

  RxBool isAdsEnabled = false.obs;

  void init() {
    if (kReleaseMode) {
      initializePlugin();
    }

    if (Platform.isIOS) {
      isAdsEnabled.value = false;
    } else {
      isAdsEnabled.value = true;
    }
  }

  Future<void> initializePlugin() async {
    print("Initializing SDK...");
    if (!isAdsEnabled.value) return;
    MaxConfiguration? configuration = await AppLovinMAX.initialize(_sdk_key);
    if (configuration != null) {
      isInitialized.value = true;

      print("SDK Initialized: $configuration");
      AppLovinMAX.setVerboseLogging(false);

      attachAdListeners();
      AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
      // AppLovinMAX.loadRewardedAd(AppStrings.MAX_Reward_ID);
      //  AppLovinMAX.createMRec(AppStrings.MAX_MREC_ID, AdViewPosition.centered);
      // AppLovinMAX.createBanner(
      //     AppStrings.MAX_BANNER_ID, AdViewPosition.bottomCenter);
    } else {
      print("SDK null");
    }
  }

  void attachAdListeners() {
    // AppLovinMAX.setRewardedAdListener(
    //     RewardedAdListener(onAdLoadedCallback: (ad) {
    //   rewardedAdLoadState = AdLoadState.loaded;

    //   // Rewarded ad is ready to be shown. AppLovinMAX.isRewardedAdReady(_rewarded_ad_unit_id) will now return 'true'
    //   print('Rewarded ad loaded from ${ad.networkName}');

    //   // Reset retry attempt
    //   rewardedAdRetryAttempt = 0;
    // }, onAdLoadFailedCallback: (adUnitId, error) {
    //   rewardedAdLoadState = AdLoadState.notLoaded;

    //   // Rewarded ad failed to load
    //   // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
    //   rewardedAdRetryAttempt = rewardedAdRetryAttempt + 1;

    //   int retryDelay = pow(2, min(6, rewardedAdRetryAttempt)).toInt();
    //   print(
    //       'Rewarded ad failed to load with code ${error.code} - retrying in ${retryDelay}s');

    //   Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
    //     AppLovinMAX.loadRewardedAd(AppStrings.MAX_Reward_ID);
    //   });
    // }, onAdDisplayedCallback: (ad) {
    //   print('Rewarded ad displayed');
    // }, onAdDisplayFailedCallback: (ad, error) {
    //   rewardedAdLoadState = AdLoadState.notLoaded;
    //   print(
    //       'Rewarded ad failed to display with code ${error.code} and message ${error.message}');
    // }, onAdClickedCallback: (ad) {
    //   print('Rewarded ad clicked');
    // }, onAdHiddenCallback: (ad) {
    //   rewardedAdLoadState = AdLoadState.notLoaded;
    //   print('Rewarded ad hidden');
    // }, onAdReceivedRewardCallback: (ad, reward) {
    //   print('Rewarded ad granted reward');
    // }, onAdRevenuePaidCallback: (ad) {
    //   print('Rewarded ad revenue paid: ${ad.revenue}');
    // }));

    /// Interstitial Ad Listeners
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        interstitialLoadState = AdLoadState.loaded;

        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialAdReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);

        // Reset retry attempt
        interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        interstitialLoadState = AdLoadState.notLoaded;

        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        interstitialRetryAttempt = interstitialRetryAttempt + 1;

        int retryDelay = pow(2, min(6, interstitialRetryAttempt)).toInt();
        print('Interstitial ad failed to load with code ' +
            error.code.toString() +
            ' - retrying in ' +
            retryDelay.toString() +
            's');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        });
      },
      onAdDisplayedCallback: (ad) {
        print('Interstitial ad displayed');
        // AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        //   Future.delayed(Duration(milliseconds: 2 * 1000), () {
        // print('Interstitial ad reloading after display');

        //   AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        // });
      },
      onAdDisplayFailedCallback: (ad, error) {
        interstitialLoadState = AdLoadState.notLoaded;
        print('Interstitial ad failed to display with code ' +
            error.code.toString() +
            ' and message ' +
            error.message);
      },
      onAdClickedCallback: (ad) {
        print('Interstitial ad clicked');
      },
      onAdHiddenCallback: (ad) {
        interstitialLoadState = AdLoadState.notLoaded;
        Future.delayed(Duration(milliseconds: 2 * 1000), () {
          print('Interstitial ad reloading after display');

          AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        });
        print('Interstitial ad hidden');
      },
    ));

    /// Banner Ad Listeners
    AppLovinMAX.setBannerListener(AdViewAdListener(onAdLoadedCallback: (ad) {
      print('Banner ad loaded from ' + ad.networkName);
      AppLovinMAX.showBanner(AppStrings.MAX_BANNER_ID);
    }, onAdLoadFailedCallback: (adUnitId, error) {
      print('Banner ad failed to load with error code ' +
          error.code.toString() +
          ' and message: ' +
          error.message);
    }, onAdClickedCallback: (ad) {
      print('Banner ad clicked');
    }, onAdExpandedCallback: (ad) {
      print('Banner ad expanded');
    }, onAdCollapsedCallback: (ad) {
      print('Banner ad collapsed');
    }));

    /// MREC Ad Listeners
    AppLovinMAX.setMRecListener(AdViewAdListener(onAdLoadedCallback: (ad) {
      print('MREC ad loaded from ' + ad.networkName);
    }, onAdLoadFailedCallback: (adUnitId, error) {
      print('MREC ad failed to load with error code ' +
          error.code.toString() +
          ' and message: ' +
          error.message);
    }, onAdClickedCallback: (ad) {
      print('MREC ad clicked');
    }, onAdExpandedCallback: (ad) {
      print('MREC ad expanded');
    }, onAdCollapsedCallback: (ad) {
      print('MREC ad collapsed');
    }));
  }

  void showInterstitial(Function onInterAdWatched) async {
    if (!isAdsEnabled.value) return;
    // if(Platform.isIOS && isInitialized.value){
    //   print(object)
    //   return;
    // }
    // interCounter++;
    // if(interCounter<4){
    //   return;
    // }
    // interCounter = 1;

    print("Interstitial ad is show is called");
    bool? isInterstitialReady =
        await AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id);
    print("return: $isInterstitialReady");
    // if (isInitialized.value && isInterstitialReady!) {

    // print("Interstitial ad ready to show");

    // }

    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        interstitialLoadState = AdLoadState.loaded;

        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialAdReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);

        // Reset retry attempt
        interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        interstitialLoadState = AdLoadState.notLoaded;

        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        interstitialRetryAttempt = interstitialRetryAttempt + 1;

        int retryDelay = pow(2, min(6, interstitialRetryAttempt)).toInt();
        print('Interstitial ad failed to load with code ' +
            error.code.toString() +
            ' - retrying in ' +
            retryDelay.toString() +
            's');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        });
      },
      onAdDisplayedCallback: (ad) {
        print('Interstitial ad displayed');
        // AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        //   Future.delayed(Duration(milliseconds: 2 * 1000), () {
        // print('Interstitial ad reloading after display');

        //   AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        // });
      },
      onAdDisplayFailedCallback: (ad, error) {
        interstitialLoadState = AdLoadState.notLoaded;
        print('Interstitial ad failed to display with code ' +
            error.code.toString() +
            ' and message ' +
            error.message);
      },
      onAdClickedCallback: (ad) {
        print('Interstitial ad clicked');
      },
      onAdHiddenCallback: (ad) {
        interstitialLoadState = AdLoadState.notLoaded;
        Future.delayed(Duration(milliseconds: 2 * 1000), () {
          print('Interstitial ad reloading after display');

          AppLovinMAX.loadInterstitial(_interstitial_ad_unit_id);
        });
        print('Interstitial ad hidden');
        onInterAdWatched();
      },
    ));

    AppLovinMAX.showInterstitial(_interstitial_ad_unit_id);
  }

  //reward AD

  // void showRewardedAd(Function onRewardedAdWatched) async {
  //   if (!isAdsEnabled.value) return;
  //   bool isReady =
  //       await AppLovinMAX.isRewardedAdReady(AppStrings.MAX_Reward_ID) ?? false;
  //   if (isReady) {
  //     AppLovinMAX.showRewardedAd(AppStrings.MAX_Reward_ID);
  //   } else {
  //     print('Loading rewarded ad...');
  //     rewardedAdLoadState = AdLoadState.loading;
  //     AppLovinMAX.loadRewardedAd(AppStrings.MAX_Reward_ID);
  //   }

  //   AppLovinMAX.setRewardedAdListener(RewardedAdListener(
  //     onAdLoadedCallback: (ad) {
  //       rewardedAdLoadState = AdLoadState.loaded;
  //       print('Rewarded ad loaded from ${ad.networkName}');
  //       rewardedAdRetryAttempt = 0;
  //     },
  //     onAdDisplayedCallback: (ad) {
  //       print('Rewarded ad displayed');
  //     },
  //     onAdHiddenCallback: (ad) {
  //       rewardedAdLoadState = AdLoadState.notLoaded;
  //       print('Rewarded ad hidden');
  //       // Invoke the onRewardedAdWatched function when the rewarded ad is hidden
  //       onRewardedAdWatched();
  //       // temp();
  //     },
  //     onAdLoadFailedCallback: (String adUnitId, MaxError error) {},
  //     onAdDisplayFailedCallback: (MaxAd ad, MaxError error) {},
  //     onAdReceivedRewardCallback: (MaxAd ad, MaxReward reward) {},
  //     onAdClickedCallback: (MaxAd ad) {},
  //   ));
  // }

  temp() {
    print("Rewarded Temp");
  }
}

enum AdLoadState { notLoaded, loading, loaded }
