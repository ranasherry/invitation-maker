import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/controller/anniversary_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Anniversary_Template3 extends StatefulWidget {
  Anniversary_Template3({super.key, required this.controller});
  AnniversaryCTL controller;
  @override
  State<Anniversary_Template3> createState() => _Anniversary_Template3State();
}

class _Anniversary_Template3State extends State<Anniversary_Template3> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20143.png?alt=media&token=68502e6b-1ad5-4c88-9cae-6f51801b1928",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 21),
              Text("$marriagedate Annivarsary",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 70.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF7CE3A)),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
              Text(husbandName,
                  style: GoogleFonts.greatVibes(
                    textStyle: TextStyle(
                        fontSize: 100.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFFF7CE3A)),
                  )),
              Text("&",
                  style: GoogleFonts.greatVibes(
                    textStyle: TextStyle(
                        fontSize: 100.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFFF7CE3A)),
                  )),
              Text(wifeName,
                  style: GoogleFonts.greatVibes(
                    textStyle: TextStyle(
                        fontSize: 100.sp,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFFF7CE3A)),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$day,",
                    style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    MonthName,
                    style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    "$date,",
                    style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    year,
                    style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
                  ),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                time,
                style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                address,
                style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Text(
                contact,
                style: TextStyle(fontSize: 55.sp, color: Color(0xFFC14E4E)),
              )
            ],
          )
        ],
      ),
    );
  }
}
