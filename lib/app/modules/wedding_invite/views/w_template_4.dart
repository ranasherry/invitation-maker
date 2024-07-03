import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Wedding_Template4 extends StatefulWidget {
  Wedding_Template4({super.key, required this.controller});
  WeddingInviteController controller;
  @override
  State<Wedding_Template4> createState() => _Wedding_Template4State();
}

class _Wedding_Template4State extends State<Wedding_Template4> {
  String groomName = "";
  String brideName = "";
  String MonthName = "";
  String date = "";
  String day = "Sunday";
  String year = "";
  String time = "";
  String address = "";
  String contact = "";

  TextStyle mainText = TextStyle(
      fontSize: 60.sp, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      initdata();
    });

    super.initState();
  }

  initdata() {
    groomName = widget.controller.groomNameTextController.text;
    brideName = widget.controller.brideNameTextController.text;
    address = widget.controller.addressTextController.text;
    contact = widget.controller.contactNoController.text;

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
      // backgroundColor: Color(0xFFE7EBFA),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2017.png?alt=media&token=8157ef99-ee07-4727-a064-d398d165e55a",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 13.5),
              Text(groomName,
                  style: GoogleFonts.italianno(
                      textStyle: TextStyle(
                          fontSize: 90.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)))),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                "AND",
                style: TextStyle(
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC29409)),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(brideName,
                  style: GoogleFonts.italianno(
                      textStyle: TextStyle(
                          fontSize: 90.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)))),
              verticalSpace(SizeConfig.blockSizeVertical * 2.1),
              Text("INVITE YOU TO JOIN IN THEIR",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                          color: Color(0xFFC29409)))),
              Text("WEDDING CELEBERATION",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                          color: Color(0xFFC29409)))),
              verticalSpace(SizeConfig.blockSizeVertical * 2.1),
              Text(
                MonthName,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2.5),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: mainText,
                    ),
                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 8,
                          right: SizeConfig.blockSizeHorizontal * 4),
                      child: Text(
                        date,
                        style: mainText,
                      ),
                    ),
                    // Spacer(),

                    Text(
                      time,
                      style: mainText,
                    ),
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                year,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1.5),
              Text(
                address,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text("Contact: ${contact}",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3,
                      color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
