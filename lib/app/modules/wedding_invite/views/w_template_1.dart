import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Wedding_Template1 extends StatefulWidget {
  Wedding_Template1({super.key, required this.controller});
  WeddingInviteController controller;
  @override
  State<Wedding_Template1> createState() => _Wedding_Template1State();
}

class _Wedding_Template1State extends State<Wedding_Template1> {
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
      color: Color(0xFF713F15), fontSize: 60.sp, fontWeight: FontWeight.bold);

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
                    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/weddingCards%2FGroup%20269.png?alt=media&token=f20d46aa-cb6b-4eaa-8c28-e71e389dad90",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 22.5),
              Text(
                groomName,
                style: GoogleFonts.italianno(
                    textStyle: TextStyle(
                        fontSize: 120.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF713F15))),
              ),
              // verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text("&",
                  style: GoogleFonts.charmonman(
                      textStyle: TextStyle(
                          fontSize: 100.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFF713F15)))),
              // verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(brideName,
                  style: GoogleFonts.italianno(
                      textStyle: TextStyle(
                          fontSize: 120.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF713F15)))),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                MonthName,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF713F15))),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 22),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      day,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 60.sp,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFF713F15))),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2),
                      child: Text(
                        date,
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 60.sp,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xFF713F15))),
                      ),
                    ),
                    Spacer(),
                    Text(
                      time,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 60.sp,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFF713F15))),
                    ),
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                year,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF713F15))),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                address,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF713F15))),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
              Text(
                contact,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF713F15))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
