import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/w_template_1.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/w_template_2.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/w_template_3.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/w_template_4.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/w_template_5.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/w_template_6.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:invitation_maker/app/utills/size_config.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:widget_screenshot/widget_screenshot.dart';

class WeddingInviteHome extends GetView<WeddingInviteController> {
  const WeddingInviteHome({Key? key}) : super(key: key);
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
                  ? 'Wedding Invitation Cards'
                  : "Wedding Invitation Maker",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  fontWeight: FontWeight.bold),
            ),
          ),
          bottom: PreferredSize(
              child: Container(
                margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal * 3,
                    left: SizeConfig.blockSizeHorizontal * 3),
                color: Theme.of(context).colorScheme.primary,
                height: 1.5,
              ),
              preferredSize: Size.fromHeight(6.0)),

          leading: GestureDetector(
              onTap: () {
                if (controller.isOnTemplates.value) {
                  controller.isOnTemplates.value = false;
                } else {
                  print("Back");
                  Get.back();
                }
                // Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new_rounded)),

          // backgroundColor: Colors.lightBlueAccent,
        ),
        floatingActionButton: Obx(() => controller.isOnTemplates.value
            ? Container()
            : FloatingActionButton.extended(
                backgroundColor: Colors.green,
                onPressed: () {
                  // Perform validation before submission

                  controller.onNext();
                },
                label: Row(
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ))),
        body: Obx(() => controller.isOnTemplates.value
            ? SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: SizeConfig.screenHeight * 0.7,
                          child: WidgetShot(
                            key: controller.shotKey,
                            child: Obx(() => IndexedStack(
                                  index: controller.selectedIndex.value,
                                  children: [
                                    Wedding_Template1(controller: controller),
                                    Wedding_Template2(controller: controller),
                                    Wedding_Template3(controller: controller),
                                    Wedding_Template4(controller: controller),
                                    Wedding_Template5(controller: controller),
                                    Wedding_Template6(controller: controller),
                                  ],
                                )),
                          )),
                      designSelector(),
                      verticalSpace(SizeConfig.blockSizeVertical * 2),
                      GestureDetector(
                        onTap: () {
                          controller.saveCard();
                        },
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 5.5,
                          width: SizeConfig.blockSizeHorizontal * 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.indigoAccent, Colors.indigo],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              // color: Colors.indigo,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal * 6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              horizontalSpace(
                                  SizeConfig.blockSizeHorizontal * 2),
                              Text(
                                "Share",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton.icon(
                      //     onPressed: () {
                      //       controller.saveCard();
                      //     },
                      //     icon: Icon(Icons.share),
                      //     label: Text("Share"))
                    ],
                  ),
                ),
              )
            : _inputFieldView(context)),
      ),
    );
  }

  Widget designSelector() {
    return Container(
        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
        height: SizeConfig.blockSizeVertical * 5,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.NetworkImages.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
                child: GestureDetector(
                  onTap: () {
                    controller.selectedIndex.value = index;
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: SizeConfig.blockSizeVertical * 5,
                        height: SizeConfig.blockSizeVertical * 5,
                        decoration: BoxDecoration(
                          // color: AppColors.cardBackground_color,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeHorizontal * 5),
                          // Apply the border radius to the image itself
                          image: DecorationImage(
                            fit: BoxFit.fill, // Fill the entire container
                            image: CachedNetworkImageProvider(
                                controller.NetworkImages[index]),
                          ),
                        ),
                      ),
                      Obx(() => controller.selectedIndex.value == index
                          ? Container(
                              width: SizeConfig.blockSizeVertical * 5,
                              height: SizeConfig.blockSizeVertical * 5,
                              decoration: BoxDecoration(
                                // color: AppColors.cardBackground_color,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeHorizontal * 5),
                                // Apply the border radius to the image itself
                                color: Color.fromARGB(96, 68, 62, 62),
                              ),
                              child: Center(child: Icon(Icons.check)),
                            )
                          : Container())
                    ],
                  ),
                ),
              );
            }));
  }

  SingleChildScrollView _inputFieldView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Groom Name Input
            verticalSpace(SizeConfig.blockSizeVertical * 2),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow, // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 5), // Offset in x and y direction
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller.groomNameTextController,
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                  labelText: 'Groom Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter the groom\'s name',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 4),
                      borderSide: BorderSide.none
                      // borderSide: BorderSide(
                      //   color: Color(0xFF0095B0), // Border color
                      //   width: 1.0, // Border width
                      // ),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      // Color(0xFF0095B0), // Border color when focused
                      width: 1.0, // Border width when focused
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the groom\'s name' : null,
              ),
            ),
            SizedBox(height: 20),

            // Bride Name Input
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow, // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 5), // Offset in x and y direction
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller.brideNameTextController,
                decoration: InputDecoration(
                  labelText: 'Bride Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter the bride\'s name',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 4),
                      borderSide: BorderSide.none
                      // borderSide: BorderSide(
                      //   color: Color(0xFF0095B0), // Border color
                      //   width: 1.0, // Border width
                      // ),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      // Color(0xFF0095B0), // Border color when focused
                      width: 1.0, // Border width when focused
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the bride\'s name' : null,
              ),
            ),

            SizedBox(height: 20),

            // Contact Number Input
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow, // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 5), // Offset in x and y direction
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller.contactNoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter the contact number',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 4),
                      borderSide: BorderSide.none
                      // borderSide: BorderSide(
                      //   color: Color(0xFF0095B0), // Border color
                      //   width: 1.0, // Border width
                      // ),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      // Color(0xFF0095B0), // Border color when focused
                      width: 1.0, // Border width when focused
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) => !value!.isPhoneNumber
                    ? 'Please enter a valid phone number'
                    : null,
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow, // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 5), // Offset in x and y direction
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller.addressTextController,
                decoration: InputDecoration(
                  labelText: 'Venue',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter Venue Address',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 4),
                      borderSide: BorderSide.none
                      // borderSide: BorderSide(
                      //   color: Color(0xFF0095B0), // Border color
                      //   width: 1.0, // Border width
                      // ),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      // Color(0xFF0095B0), // Border color when focused
                      width: 1.0, // Border width when focused
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the bride\'s name' : null,
              ),
            ),

            // Wedding Date Selection
            verticalSpace(SizeConfig.blockSizeVertical * 3),
            GestureDetector(
              onTap: () async {
                final selectedDate = await showOmniDateTimePicker(
                  context: context,
                  initialDate: controller.dateTime,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2050),
                );
                if (selectedDate != null) {
                  controller.dateTime = selectedDate;
                }
              },
              child: Container(
                height: SizeConfig.blockSizeVertical * 6,
                width: SizeConfig.blockSizeHorizontal * 60,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.indigoAccent.shade200],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    // color: Colors.indigo,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 6)),
                child: Center(
                  child: Text(
                    'Select Wedding Date: ${controller.dateTime.day}-${controller.dateTime.month}-${controller.dateTime.year}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     final selectedDate = await showOmniDateTimePicker(
            //       context: context,
            //       initialDate: controller.dateTime,
            //       firstDate: DateTime(2020),
            //       lastDate: DateTime(2050),
            //     );
            //     if (selectedDate != null) {
            //       controller.dateTime = selectedDate;
            //     }
            //   },
            //   child: Text(
            //     'Select Wedding Date: ${controller.dateTime.day}-${controller.dateTime.month}-${controller.dateTime.year}',
            //   ),
            // ),

            verticalSpace(SizeConfig.blockSizeVertical * 1.5),
          ],
        ),
      ),
    );
  }
}
