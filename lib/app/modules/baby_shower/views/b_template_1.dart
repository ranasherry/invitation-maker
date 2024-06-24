import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/baby_shower/controller/baby_shower_card_ctl.dart';
import 'package:invitation_maker/app/modules/party_card/controller/party_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class babyShower_Template1 extends StatefulWidget {
  babyShower_Template1({super.key, required this.controller});
  BabyShowerCTL controller;
  @override
  State<babyShower_Template1> createState() => _babyShower_Template1State();
}

class _babyShower_Template1State extends State<babyShower_Template1> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20231%202.png?alt=media&token=f3ff3e62-f0db-4cbb-a3d2-ade705c476cc",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 47),
              Text(
                "In honor of",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFEF8792)),
                ),
              ),
              Text(
                Name,
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 80.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF61BADA)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$day, ",
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFEF8792)),
                    ),
                  ),
                  Text(
                    MonthName,
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFEF8792)),
                    ),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    date,
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFEF8792)),
                    ),
                  ),
                  Text(
                    " At $time,",
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFFEF8792)),
                    ),
                  ),
                ],
              ),
              Text(
                "Venue: $address",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFEF8792)),
                ),
              ),
              Text(
                contact,
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFEF8792)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
