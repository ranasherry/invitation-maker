import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/graduation_party/controller/graduation_party_ctl.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Graduate_Template1 extends StatefulWidget {
  Graduate_Template1({super.key, required this.controller});
  GraduationPartyCTL controller;
  @override
  State<Graduate_Template1> createState() =>
      _Graduate_Template1_Template1State();
}

class _Graduate_Template1_Template1State extends State<Graduate_Template1> {
  String graduateName = "";
  // String RSVPName = "";
  String MonthName = "";
  String date = "";
  String day = "Sunday";
  String year = "";
  String time = "";
  String address = "";
  String contact = "";

  TextStyle mainText = TextStyle(
      color: Colors.red, fontSize: 60.sp, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      initdata();
    });

    super.initState();
  }

  initdata() {
    graduateName = widget.controller.graduateNameTextController.text;
    // RSVPName = widget.controller.RSVPNameTextController.text;
    address = widget.controller.addressTextController.text;
    // contact = widget.controller.contactNoController.text;

    // Extract date information from the selected DateTime object
    final selectedDate = widget.controller.dateTime;

    // Extract individual components
    MonthName = DateFormat('MMMM').format(selectedDate); // Full month name
    date = selectedDate.day.toString();
    year = selectedDate.year.toString();

    // Format time if needed (replace with your desired format)
    time =
        DateFormat('hh:mm a').format(selectedDate); // 12-hour format with AM/PM

    day = DateFormat('EEEE').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7EBFA),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              color: Theme.of(context).colorScheme.background,
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20122.png?alt=media&token=baa53e6e-8b0b-4097-9f0d-d3d22cf59f07",
                errorWidget: (context, url, error) {
                  return Container(
                      child: Image.asset(
                    AppImages.wedding,
                  ));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 50.7),
              Text(
                graduateName,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.9),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 28),
                child: Row(
                  children: [
                    Text(
                      "$day,",
                      style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 0.6),
                    Text(
                      MonthName,
                      style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "$date,",
                      style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 0.6),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2.1),
              Text(
                "Venue: $address",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
