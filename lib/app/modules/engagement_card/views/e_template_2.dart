import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/engagement_card/controller/engagement_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Engagement_Template2 extends StatefulWidget {
  Engagement_Template2({super.key, required this.controller});
  engagementCardCTL controller;
  @override
  State<Engagement_Template2> createState() => _Engagement_Template2State();
}

class _Engagement_Template2State extends State<Engagement_Template2> {
  String maleFiance = "";
  String femaleFiance = "";
  String MonthName = "";
  String date = "";
  String day = "Sunday";
  String year = "";
  String time = "";
  String address = "";
  String contact = "";

  TextStyle mainText = TextStyle(
      color: Colors.black, fontSize: 60.sp, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      initdata();
    });

    super.initState();
  }

  initdata() {
    maleFiance = widget.controller.maleFianceNameTextController.text;
    femaleFiance = widget.controller.femaleFianceNameTextController.text;
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20160.png?alt=media&token=a6ab485e-851f-4f04-8fcd-af3b77f87731",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 28.5),
              Text(maleFiance,
                  style: GoogleFonts.ibarraRealNova(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 7),
              Text(femaleFiance,
                  style: GoogleFonts.ibarraRealNova(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 3),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$day,",
                        style: GoogleFonts.ibmPlexSans(
                          textStyle:
                              TextStyle(fontSize: 50.sp, color: Colors.black),
                        )),
                    Row(
                      children: [
                        horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                        Text(MonthName,
                            style: GoogleFonts.ibmPlexSans(
                              textStyle: TextStyle(
                                  fontSize: 50.sp, color: Colors.black),
                            )),
                        horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                        Text("$date,",
                            style: GoogleFonts.ibmPlexSans(
                              textStyle: TextStyle(
                                  fontSize: 50.sp, color: Colors.black),
                            )),
                        horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                        Text(year,
                            style: GoogleFonts.ibmPlexSans(
                              textStyle: TextStyle(
                                  fontSize: 50.sp, color: Colors.black),
                            )),
                      ],
                    ),
                    verticalSpace(SizeConfig.blockSizeVertical * 0.5),
                    Text(time,
                        style: GoogleFonts.ibmPlexSans(
                          textStyle:
                              TextStyle(fontSize: 50.sp, color: Colors.black),
                        )),
                    verticalSpace(SizeConfig.blockSizeVertical * 0.5),
                    Text(address,
                        style: GoogleFonts.ibmPlexSans(
                          textStyle:
                              TextStyle(fontSize: 50.sp, color: Colors.black),
                        )),
                    verticalSpace(SizeConfig.blockSizeVertical * 0.5),
                    Text(contact,
                        style: GoogleFonts.ibmPlexSans(
                          textStyle:
                              TextStyle(fontSize: 50.sp, color: Colors.black),
                        ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
