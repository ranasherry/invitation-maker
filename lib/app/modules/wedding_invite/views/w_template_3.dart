import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/wedding_invite/controller/wedding_invite_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Wedding_Template3 extends StatefulWidget {
  Wedding_Template3({super.key, required this.controller});
  WeddingInviteController controller;
  @override
  State<Wedding_Template3> createState() => _Wedding_Template3State();
}

class _Wedding_Template3State extends State<Wedding_Template3> {
  String groomName = "";
  String brideName = "";
  String MonthName = "";
  String date = "";
  String day = "Sunday";
  String year = "";
  String time = "";
  String address = "";
  String contact = "";

  String addOrdinalIndicator(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return '$number' + 'th';
    }
    switch (number % 10) {
      case 1:
        return '$number' + 'st';
      case 2:
        return '$number' + 'nd';
      case 3:
        return '$number' + 'rd';
      default:
        return '$number' + 'th';
    }
  }

  TextStyle mainText = TextStyle(
      fontSize: 60.sp, fontWeight: FontWeight.bold, color: Color(0xFFCBA35C));

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
    date = addOrdinalIndicator(selectedDate.day);
    year = selectedDate.year.toString();

    // Format time if needed (replace with your desired format)
    time = DateFormat('h a').format(selectedDate); // 12-hour format with AM/PM

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
                    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/weddingCards%2FGroup%20267.png?alt=media&token=51daa6a8-0a28-495d-9506-f4987ef8f05b",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 25),
              Text(groomName,
                  style: GoogleFonts.italianno(
                      textStyle: TextStyle(
                          fontSize: 100.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)))),
              // verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text("&",
                  style: GoogleFonts.italianno(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)))),
              // verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(brideName,
                  style: GoogleFonts.italianno(
                      textStyle: TextStyle(
                          fontSize: 100.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)))),
              // verticalSpace(SizeConfig.blockSizeVertical * 4.2),
              verticalSpace(SizeConfig.blockSizeVertical * 0),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MonthName.substring(0, 3),
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 60.sp,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xFFF7DFB5)))),

                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 1),
                      child: Text(date,
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 60.sp,
                                  // fontWeight: FontWeight.bold,
                                  color: Color(0xFFF7DFB5)))),
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    // Spacer(),
                    Text(year,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 60.sp,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xFFF7DFB5)))),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    Text("At ${time}",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 60.sp,
                                // fontWeight: FontWeight.bold,
                                color: Color(0xFFF7DFB5)))),
                  ],
                ),
              ),
              // verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(address,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFF7DFB5)))),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text("Contact: ${contact}",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFF7DFB5)))),
            ],
          )
        ],
      ),
    );
  }
}
