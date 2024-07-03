import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Wedding_Template2 extends StatefulWidget {
  Wedding_Template2({super.key, required this.controller});
  WeddingInviteController controller;
  @override
  State<Wedding_Template2> createState() => _Wedding_Template2State();
}

class _Wedding_Template2State extends State<Wedding_Template2> {
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
      fontSize: 60.sp, fontWeight: FontWeight.bold, color: Color(0xFF3F6F9F));

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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2016.png?alt=media&token=4b5b1ed1-7957-49f5-b3d2-4e4e7f4b7d82",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 10),
              Text(
                "TOGETHER",
                style: GoogleFonts.raleway(color: Color(0xFF3F6F9F)),
              ),
              Text(
                "WITH THEIR FAMILIES",
                style: GoogleFonts.raleway(color: Color(0xFF3F6F9F)),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 4),
              Text(groomName,
                  style: GoogleFonts.ibarraRealNova(
                      textStyle: TextStyle(
                          fontSize: 100.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F6F9F)))),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text("&",
                  style: GoogleFonts.charmonman(
                      textStyle: TextStyle(
                          fontSize: 80.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F6F9F)))),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(brideName,
                  style: GoogleFonts.ibarraRealNova(
                      textStyle: TextStyle(
                          fontSize: 100.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F6F9F)))),
              verticalSpace(SizeConfig.blockSizeVertical * 2.1),
              Text("INVITE YOU TO JOIN WEDDING",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Color(0xFF3F6F9F),
                          fontSize: SizeConfig.blockSizeHorizontal * 4))),
              verticalSpace(SizeConfig.blockSizeVertical * 2.1),
              Text(
                MonthName,
                style: mainText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [line_divide(), line_divide()],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: mainText,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 3),
                      child: Text(
                        date,
                        style: mainText,
                      ),
                    ),
                    Spacer(),
                    Text(
                      time,
                      style: mainText,
                    ),
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [line_divide(), line_divide()],
              ),
              Text(
                year,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1.5),
              Text(
                address,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0),
              Text(
                "Reception to follow",
                style: GoogleFonts.dancingScript(
                    textStyle: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 6,
                        color: Color(0xFFB67C19))),
              ),
              Text("Contact: ${contact}",
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3)),
            ],
          )
        ],
      ),
    );
  }

  Container line_divide() {
    return Container(
      height: SizeConfig.blockSizeVertical * 0.1,
      width: SizeConfig.blockSizeHorizontal * 20,
      color: Colors.black,
    );
  }
}
