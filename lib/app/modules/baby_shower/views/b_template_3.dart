import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/baby_shower/controller/baby_shower_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class babyShower_Template3 extends StatefulWidget {
  babyShower_Template3({super.key, required this.controller});
  BabyShowerCTL controller;
  @override
  State<babyShower_Template3> createState() => _babyShower_Template3State();
}

class _babyShower_Template3State extends State<babyShower_Template3> {
  String Name = "";
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
    Name = widget.controller.NameTextController.text;

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
                    "https://firebasestorage.googleapis.com/v0/b/wedding-invitation-utility.appspot.com/o/babyShower%2FGroup%20243.png?alt=media&token=154e6a80-2a16-46a5-95cd-ec3590b2d39b",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 32),
              Text(
                Name,
                style: GoogleFonts.greyQo(
                  textStyle: TextStyle(
                      fontSize: 200.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFFA5A2)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$day, ",
                    style: GoogleFonts.hanuman(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  Text(
                    MonthName,
                    style: GoogleFonts.hanuman(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    date,
                    style: GoogleFonts.hanuman(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                " At $time,",
                style: GoogleFonts.hanuman(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                "Venue: ",
                style: GoogleFonts.hanuman(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                address,
                style: GoogleFonts.hanuman(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                contact,
                style: GoogleFonts.hanuman(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E1E)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
