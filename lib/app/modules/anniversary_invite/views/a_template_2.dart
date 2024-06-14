import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/controller/anniversary_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Anniversary_Template2 extends StatefulWidget {
  Anniversary_Template2({super.key, required this.controller});
  AnniversaryCTL controller;
  @override
  State<Anniversary_Template2> createState() => _Anniversary_Template2State();
}

class _Anniversary_Template2State extends State<Anniversary_Template2> {
  String husbandName = "";
  String wifeName = "";
  String marriagedate = "";
  String MonthName = "";
  String date = "";
  String day = "Sunday";
  String year = "";
  String time = "";
  String address = "";
  String contact = "";

  TextStyle mainText = TextStyle(
      color: Colors.brown, fontSize: 60.sp, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      initdata();
    });

    super.initState();
  }

  initdata() {
    husbandName = widget.controller.husbandNameTextController.text;
    wifeName = widget.controller.wifeNameTextController.text;
    marriagedate = widget.controller.marriagedateTextController.text;
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20142.png?alt=media&token=cf266124-9d2e-4d06-a0f0-31e90cf54723",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 12),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 35),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 35,
                  child: Text("Join us as we celebrate our",
                      style: GoogleFonts.satisfy(
                        textStyle: TextStyle(
                            fontSize: 85.sp,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 4),
              Text(husbandName,
                  style: GoogleFonts.italianno(
                    textStyle: TextStyle(
                        fontSize: 140.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFFDBB471)),
                  )),
              Text("&",
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        fontSize: 85.sp,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Text(wifeName,
                  style: GoogleFonts.italianno(
                    textStyle: TextStyle(
                        fontSize: 140.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFFDBB471)),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 1,
                    right: SizeConfig.blockSizeHorizontal * 20),
                child: Text("$marriagedate Anniversary",
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                          fontSize: 80.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$day,",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 55.sp,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFFDBB471)),
                        )),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    Text(MonthName,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 55.sp,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFFDBB471)),
                        )),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    Text("$date,",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 55.sp,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFFDBB471)),
                        )),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    Text(year,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 55.sp,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFFDBB471)),
                        )),
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 20),
                child: Text(time,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 55.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFDBB471)),
                    )),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 20),
                child: Text(address,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 55.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFDBB471)),
                    )),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 20),
                child: Text(contact,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 55.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFDBB471)),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
