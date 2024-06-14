import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invitation_maker/app/modules/graduation_party/controller/graduation_party_ctl.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class Graduate_Template6 extends StatefulWidget {
  Graduate_Template6({super.key, required this.controller});
  GraduationPartyCTL controller;
  @override
  State<Graduate_Template6> createState() =>
      _Graduate_Template6_Template6State();
}

class _Graduate_Template6_Template6State extends State<Graduate_Template6> {
  String graduateName = "";
  // String RSVPName = "";
  String MonthName = "";
  String date = "";
  String day = "Sunday";
  String year = "";
  String time = "";
  String address = "";
  String contact = "";

  TextStyle mainText = TextStyle(
      color: Color(0xFFFCDA25), fontSize: 70.sp, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      initdata();
    });

    super.initState();
  }

  initdata() {
    graduateName = widget.controller.graduateNameTextController.text;
    // RSVPName = widget.controller.RSVPNameTextController.text;
    address = widget.controller.addressTextController.text;
    // contact = widget.controller.contactNoController.text;

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
      backgroundColor: Color(0xFFE7EBFA),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              color: Theme.of(context).colorScheme.background,
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/ai-slide-generator.appspot.com/o/invitation_cards%2FGroup%20139.png?alt=media&token=f34d7dbc-aa09-4314-87b8-cb0ecbfc920b",
                errorWidget: (context, url, error) {
                  return Container(
                      child: Image.asset(
                    AppImages.wedding,
                  ));
                },
              )),
          Column(
            children: [
              verticalSpace(SizeConfig.blockSizeVertical * 39.5),
              Text(
                graduateName,
                style: mainText,
              ),

              verticalSpace(SizeConfig.blockSizeVertical * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [line_divide(), line_divide()],
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFCDA25)),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 5),
                      child: Text(
                        date,
                        style: TextStyle(
                            fontSize: 80.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.blockSizeHorizontal * 2),
                      child: Text(
                        time,
                        style: TextStyle(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFCDA25)),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(SizeConfig.blockSizeVertical * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [line_divide(), line_divide()],
              ),
              // Text(
              //   year,
              //   style: mainText,
              // ),
              verticalSpace(SizeConfig.blockSizeVertical * 4),
              Text(
                "Venue: $address",
                style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFCDA25)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container line_divide() {
    return Container(
      height: SizeConfig.blockSizeVertical * 0.2,
      width: SizeConfig.blockSizeHorizontal * 20,
      color: Color(0xFFFCDA25),
    );
  }
}
