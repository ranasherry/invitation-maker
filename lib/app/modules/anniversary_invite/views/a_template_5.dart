import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/controller/anniversary_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Anniversary_Template5 extends StatefulWidget {
  Anniversary_Template5({super.key, required this.controller});
  AnniversaryCTL controller;
  @override
  State<Anniversary_Template5> createState() => _Anniversary_Template5State();
}

class _Anniversary_Template5State extends State<Anniversary_Template5> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20144.png?alt=media&token=d888a2be-67e3-42d7-aa36-da1ac3e594c4",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 28),
              Text("$marriagedate Anniversary",
                  style: GoogleFonts.merienda(
                    textStyle: TextStyle(
                        fontSize: 70.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(husbandName,
                      style: GoogleFonts.italianno(
                        textStyle: TextStyle(
                            fontSize: 90.sp,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text("&",
                      style: GoogleFonts.lobsterTwo(
                        textStyle: TextStyle(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(wifeName,
                      style: GoogleFonts.italianno(
                        textStyle: TextStyle(
                            fontSize: 90.sp,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              line_divide(),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
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

  Container line_divide() {
    return Container(
      height: SizeConfig.blockSizeVertical * 0.1,
      width: SizeConfig.blockSizeHorizontal * 30,
      color: Colors.white,
    );
  }
}
