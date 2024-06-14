import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/party_card/controller/party_card_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Party_Template3 extends StatefulWidget {
  Party_Template3({super.key, required this.controller});
  partyCardCTL controller;
  @override
  State<Party_Template3> createState() => _Party_Template3State();
}

class _Party_Template3State extends State<Party_Template3> {
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
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20147.png?alt=media&token=4949da5b-7121-4bd2-b28d-c99d7621932e",
                errorWidget: (context, url, error) {
                  return Container(child: Image.asset(AppImages.wedding));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 18),
              Text(
                partyType,
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 100.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF487AA2)),
                ),
              ),
              Text(
                "Party",
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 80.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF487AA2)),
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: GoogleFonts.holtwoodOneSc(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFF487AA2)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 2,
                        right: SizeConfig.blockSizeHorizontal * 2),
                    height: SizeConfig.blockSizeVertical * 5,
                    width: SizeConfig.blockSizeHorizontal * 0.5,
                    color: Color(0xFF487AA2),
                  ),
                  Text(
                    MonthName,
                    style: GoogleFonts.holtwoodOneSc(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFF487AA2)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 2,
                        right: SizeConfig.blockSizeHorizontal * 2),
                    height: SizeConfig.blockSizeVertical * 5,
                    width: SizeConfig.blockSizeHorizontal * 0.5,
                    color: Color(0xFF487AA2),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.holtwoodOneSc(
                      textStyle: TextStyle(
                          fontSize: 60.sp,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xFF487AA2)),
                    ),
                  ),
                ],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 4),
              Text(
                "In honor of $Name",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF487AA2)),
                ),
              ),
              Text(
                "Coctail hour $time",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF487AA2)),
                ),
              ),
              Text(
                "Venue: $address",
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF487AA2)),
                ),
              ),
              Text(
                contact,
                style: GoogleFonts.abel(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Color(0xFF487AA2)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
