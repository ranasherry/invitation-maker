import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:invitation_maker/app/modules/services/firebaseFunctions.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';
import 'package:launch_review/launch_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';

class HomeViewCTL extends GetxController {
  final formKey = GlobalKey<FormState>();

  int feedBackCount = 2;

  Rx<String> feedbackMessage = "".obs;
  String recipient = "codewithsherry@gmail.com";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> sendFeedBackEmail(String message) async {
    final Email email = Email(
      recipients: [recipient],
      subject: "Invitation Maker Feedback",
      body: message,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      showReviewDialogue(Get.context!);
    } catch (error) {
      showReviewDialogue(Get.context!);

      platformResponse = error.toString();
    }

    try {
      sendFirebaseFeedback(message);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    Get.snackbar('Email Sender', platformResponse);
  }

  Future<void> sendFirebaseFeedback(message) async {
    // Firestore storage
    final feedbackCollection =
        FirebaseFirestore.instance.collection('feedback');
    final feedbackDocRef =
        await feedbackCollection.doc(FirestoreService().UserID);
    feedbackDocRef.set({
      'message': message,
      'timestamp':
          FieldValue.serverTimestamp(), // Automatically generated timestamp
    });

    // Handle success or error
    if (feedbackDocRef.id != null) {
      print('Feedback submitted successfully!');
    } else {
      print('Error submitting feedback.');
    }
  }

  void incrementFeedbackCount() {
    if (feedBackCount >= 2) {
      print("feedbackValue1: $feedBackCount");
      ShowFeedbackBottomSheet();
      feedBackCount = 0;
      print("feedbackValue2: $feedBackCount");
    } else {
      print("feedbackValue3: $feedBackCount");
      feedBackCount++;
    }
  }

  void ShowFeedbackBottomSheet() {
    log("ShowBottomSheetCalled..");
    // if (feedBackCount >= 5) {

    Future.delayed(Duration(milliseconds: 500), () {
      Get.bottomSheet(Container(
        height: SizeConfig.blockSizeVertical * 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Theme.of(Get.context!).colorScheme.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.blockSizeHorizontal * 3),
                topRight: Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.feedback,
                      color: Colors.pinkAccent,
                      scale: 14,
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 2),
                    Text(
                      "Rate your experience",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 5,
                          color: Theme.of(Get.context!).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 2),
                    Image.asset(
                      AppImages.feedback,
                      color: Colors.pinkAccent,
                      scale: 14,
                    ),
                  ],
                ),
                verticalSpace(SizeConfig.blockSizeVertical * 2),
                Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   AppImages.feedback,
                      //   scale: 10,
                      // ),
                      Text(
                        "Note: ",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 5,
                            color: Theme.of(Get.context!).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 75,
                        child: Text(
                          "We consider your feedback very seriously and will try to improve the app according to your feedback ",
                          softWrap: true,
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            color: Theme.of(Get.context!).colorScheme.primary,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(SizeConfig.blockSizeVertical * 2),
                // feedback_field(
                //     context, "Recipient", controller.recipient),
                // verticalSpace(SizeConfig.blockSizeVertical * 1),
                // feedback_field(context, "Subject", controller.subject),
                // verticalSpace(SizeConfig.blockSizeVertical * 1),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 95,
                  height: SizeConfig.blockSizeVertical * 25,
                  child: Form(
                    key: formKey,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF07171D),
                          boxShadow: [
                            BoxShadow(
                              // color: Colors.amber.withOpacity(0.2), // Shadow color
                              spreadRadius: 0, // Spread radius
                              blurRadius: 5, // Blur radius
                              offset: Offset(
                                  2, 2), // Shadow position: x and y offset
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeHorizontal * 2)),
                      child: TextFormField(
                        cursorColor: Theme.of(Get.context!).colorScheme.primary,
                        onChanged: (value) => feedbackMessage.value = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter feedback';
                          }
                          return null;
                        },

                        textAlignVertical: TextAlignVertical.top,

                        textAlign: TextAlign.left,
                        expands: true,
                        maxLines: null,

                        // controller: controller,
                        decoration: InputDecoration(
                          // border: InputBorder.none,

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal * 2),
                              borderSide: BorderSide.none),

                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(),
                          //   borderRadius: BorderRadius.circular(
                          //       SizeConfig.blockSizeHorizontal * 2),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink
                                // Theme.of(Get.context!).colorScheme.primary,
                                ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeHorizontal * 2),
                          ),
                          // labelText: 'Name',
                          // labelStyle: TextStyle(color: Colors.blue),
                          hintText: "Add your feedback",
                          hintStyle: TextStyle(color: Colors.grey),
                          // prefixIcon:
                          //     Icon(Icons.text_fields, color: Colors.blue),
                          // suffixIcon:
                          //     Icon(Icons.check_circle, color: Colors.green),
                          filled: true,
                          fillColor:
                              Theme.of(Get.context!).colorScheme.secondary,
                          // contentPadding: EdgeInsets.symmetric(
                          //   vertical: SizeConfig.blockSizeVertical * 10,
                          //   horizontal: SizeConfig.blockSizeHorizontal * 2,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),

                verticalSpace(SizeConfig.blockSizeVertical * 2),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      sendFeedBackEmail(feedbackMessage.value);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 1),
                    height: SizeConfig.blockSizeVertical * 5.5,
                    width: SizeConfig.blockSizeHorizontal * 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 3,
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.pink.shade300,
                              Colors.pink,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));

      feedBackCount = 0;
    });
    // }
    // else {
    //   feedBackCount++;
    // }
  }

  void showReviewDialogue(BuildContext context) async {
    log("showReviewDialogue");

    int finalRating = 4;

    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isReviewed = pref.getBool("isReviewed") ?? false;

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext cont) => SlideRatingDialog(
              onRatingChanged: (rating) {
                print(rating.toString());
                finalRating = rating;
              },
              buttonOnTap: () async {
                final _inAppReview = InAppReview.instance;
                if (finalRating >= 3) {
                  // Review on PlayStore
                  // LaunchReview.launch(
                  //   androidAppId: "com.invitationmaker.wedding.birthday.card",
                  // );
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
                  Get.back();

                  await storeReviewCount(finalRating);
                  // EasyLoading.showSuccess("Thanks for the Rating");
                } else {
                  Get.back();

                  //? Store Review on Firebase
                  await storeReviewCount(finalRating);
                  // EasyLoading.showSuccess("Thanks for the Rating");
                }
                // Do your Business Logic here;
              },
            ));
  }

  Future<void> storeReviewCount(int rating) async {
    final firestore = FirebaseFirestore.instance;
    final ratingDocRef = firestore.collection('Rating').doc(rating.toString());

    // Use a transaction to ensure data consistency
    await firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(ratingDocRef);
      if (!snapshot.exists) {
        transaction
            .set(ratingDocRef, {'count': 0}); // Create with initial count
      }
      transaction.update(ratingDocRef, {'count': FieldValue.increment(1)});
    });
  }
}
