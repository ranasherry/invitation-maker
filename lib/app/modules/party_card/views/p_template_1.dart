import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/party_card/controller/party_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Party_Template1 extends StatefulWidget {
  Party_Template1({super.key, required this.controller});
  partyCardCTL controller;
  @override
  State<Party_Template1> createState() => _Party_Template1State();
}

class _Party_Template1State extends State<Party_Template1> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20154.png?alt=media&token=43b37d47-8644-4fd5-a6b1-7c76ec260410",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 39),
              Text(
                partyType,
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 90.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFEC5064)),
                ),
              ),
              Text(
                "Party",
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 80.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFFEC5064)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 5),
              Text(
                "In honor of $Name",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black),
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
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    MonthName,
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal * 1),
                  Text(
                    date,
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    " At $time,",
                    style: GoogleFonts.abel(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                      color: Colors.black),
                ),
              ),
              Text(
                contact,
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
