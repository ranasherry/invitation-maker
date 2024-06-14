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
      backgroundColor: Color(0xFFE7EBFA),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/cards%2FFrame%2024.png?alt=media&token=6cdf8174-0028-4f27-898b-1f0613330bfc",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 10),
              Text(
                "Save The Date",
                style: GoogleFonts.caveat(
                    fontSize: SizeConfig.blockSizeHorizontal * 9,
                    color: Colors.white),
              ),
              Text(
                "FOR THE WEDDING OF",
                style: GoogleFonts.raleway(color: Colors.white),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 5),
              Text(
                groomName,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                "&",
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                brideName,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 4.2),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MonthName.substring(0, 3),
                      style: mainText,
                    ),

                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 1),
                      child: Text(
                        date,
                        style: mainText,
                      ),
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    // Spacer(),
                    Text(
                      year,
                      style: mainText,
                    ),
                    horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                    Text(
                      "At ${time}",
                      style: mainText,
                    ),
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              verticalSpace(SizeConfig.blockSizeVertical * 1.5),
              Text(
                address,
                style: mainText,
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
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
