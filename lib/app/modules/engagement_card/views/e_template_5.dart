import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/engagement_card/controller/engagement_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Engagement_Template5 extends StatefulWidget {
  Engagement_Template5({super.key, required this.controller});
  engagementCardCTL controller;
  @override
  State<Engagement_Template5> createState() => _Engagement_Template5State();
}

class _Engagement_Template5State extends State<Engagement_Template5> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20171.png?alt=media&token=60a7a110-2ecf-45f6-89d1-e6ff76c91180",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 34),
              Text(maleFiance,
                  style: GoogleFonts.italianno(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF644138)),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 5.5),
              Text(femaleFiance,
                  style: GoogleFonts.italianno(
                    textStyle: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF644138)),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$day,",
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      )),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(MonthName,
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      )),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text("$date,",
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      )),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(year,
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      )),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(time,
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text("Venue: $address",
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(contact,
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
