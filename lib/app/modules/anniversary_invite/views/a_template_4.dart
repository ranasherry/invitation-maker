import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/controller/anniversary_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Anniversary_Template4 extends StatefulWidget {
  Anniversary_Template4({super.key, required this.controller});
  AnniversaryCTL controller;
  @override
  State<Anniversary_Template4> createState() => _Anniversary_Template4State();
}

class _Anniversary_Template4State extends State<Anniversary_Template4> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20140.png?alt=media&token=1c9d2437-0648-49f3-bfd8-2039e93d2da3",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 14),
              Text("$marriagedate Anniversary",
                  style: GoogleFonts.dancingScript(
                    textStyle: TextStyle(
                        fontSize: 90.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 7),
              Text(husbandName,
                  style: GoogleFonts.lobsterTwo(
                    textStyle: TextStyle(
                        fontSize: 100.sp,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Text("&",
                  style: GoogleFonts.lobsterTwo(
                    textStyle: TextStyle(
                        fontSize: 100.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Text(wifeName,
                  style: GoogleFonts.lobsterTwo(
                    textStyle: TextStyle(
                        fontSize: 100.sp,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$day,",
                    style: TextStyle(fontSize: 55.sp, color: Colors.white),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    MonthName,
                    style: TextStyle(fontSize: 55.sp, color: Colors.white),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    "$date,",
                    style: TextStyle(fontSize: 55.sp, color: Colors.white),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    year,
                    style: TextStyle(fontSize: 55.sp, color: Colors.white),
                  ),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                time,
                style: TextStyle(fontSize: 55.sp, color: Colors.white),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                address,
                style: TextStyle(fontSize: 55.sp, color: Colors.white),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                contact,
                style: TextStyle(fontSize: 55.sp, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
