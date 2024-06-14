import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/party_card/controller/party_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Party_Template6 extends StatefulWidget {
  Party_Template6({super.key, required this.controller});
  partyCardCTL controller;
  @override
  State<Party_Template6> createState() => _Party_Template6State();
}

class _Party_Template6State extends State<Party_Template6> {
  String Name = "";
  String partyType = "";
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
    partyType = widget.controller.partyTypeTextController.text;
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20159.png?alt=media&token=ee758988-8491-4515-964a-65c2b1cc4df8",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 12),
              Text(
                "You are invited to",
                style: GoogleFonts.itim(
                  textStyle: TextStyle(
                      fontSize: 120.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF3953)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
              Text(
                "$partyType",
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 100.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFF3953)),
                ),
              ),
              Text(
                "Party",
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 100.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFF3953)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                "In the honour of",
                style: GoogleFonts.itim(
                  textStyle: TextStyle(
                      fontSize: 100.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFF3953)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 2),
              Text(
                Name,
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 90.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFFF3953)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "on $day, ",
                    style: GoogleFonts.ibarraRealNova(
                      textStyle: TextStyle(
                          fontSize: 70.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "$MonthName ",
                    style: GoogleFonts.ibarraRealNova(
                      textStyle: TextStyle(
                          fontSize: 70.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.ibarraRealNova(
                      textStyle: TextStyle(
                          fontSize: 70.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    " at $time",
                    style: GoogleFonts.ibarraRealNova(
                      textStyle: TextStyle(
                          fontSize: 70.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                "Venue: $address",
                style: GoogleFonts.ibarraRealNova(
                  textStyle: TextStyle(
                      fontSize: 70.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 1),
              Text(
                contact,
                style: GoogleFonts.ibarraRealNova(
                  textStyle: TextStyle(
                      fontSize: 70.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
