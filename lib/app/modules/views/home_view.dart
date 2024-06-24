import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitation_maker/app/modules/controller/home_view_ctl.dart';
import 'package:invitation_maker/app/provider/app_lovin_provider.dart';
import 'package:invitation_maker/app/routes/app_pages.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class HomeView extends GetView<HomeViewCTL> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invitation Maker",
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 5,
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.only(
                  right: SizeConfig.blockSizeHorizontal * 3,
                  left: SizeConfig.blockSizeHorizontal * 3),
              color: Theme.of(context).colorScheme.primary,
              height: 1.5,
            ),
            preferredSize: Size.fromHeight(6.0)),
      ),
      body: Column(
        children: [
          AppLovinProvider.instance.ShowBannerWidget(),
          // verticalSpace(SizeConfig.blockSizeVertical),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.WEDDINGINVITEHOME);
                    AppLovinProvider.instance.showInterstitial(() {});
                  },
                  child: cards_template(Color(0xFFFDA317), Color(0xFFFECE81),
                      "Wedding", "Card", AppImages.wedding),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed(Routes.BIRTHDAYINVITEHOME);
                //   },
                //   child: cards_template(
                //       Color(0xFFE20396),
                //       Color.fromARGB(255, 209, 90, 169),
                //       "Birthday Card",
                //       AppImages.birthday),
                // ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.GRADUATIONPARTYHOME);
                    AppLovinProvider.instance.showInterstitial(() {});
                  },
                  child: cards_template(
                      Color(0xFFBF04C3),
                      Color.fromARGB(255, 226, 134, 228),
                      "Graduation",
                      "party",
                      AppImages.graduation),
                ),
                // cards_template(
                //     Color(0xFFFFA217),
                //     Color.fromARGB(255, 255, 209, 139),
                //     "Announcement",
                //     AppImages.graduation_announcement),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PARTYCARDHOME);
                    AppLovinProvider.instance.showInterstitial(() {});
                  },
                  child: cards_template(Color(0xFFE50296), Color(0xFFD057A8),
                      "Party", "Card", AppImages.party),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.ANNIVERSARYINVITATION);
                    AppLovinProvider.instance.showInterstitial(() {});
                  },
                  child: cards_template(Color(0xFFC52726), Color(0xFFC75756),
                      "Anniversary", "Card", AppImages.anniversary),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BABYSHOWER);
                  },
                  child: cards_template(
                      Color(0xFF7E51FF),
                      Color.fromARGB(255, 161, 134, 238),
                      "Baby",
                      "Shower",
                      AppImages.baby_shower),
                ),
                // cards_template(
                //     Color(0xFFC52323),
                //     Color.fromARGB(255, 199, 92, 92),
                //     "Holidays",
                //     AppImages.holidays),
                // cards_template(
                //     Color(0xFF03BAE2),
                //     Color.fromARGB(255, 125, 215, 235),
                //     "General Card",
                //     AppImages.general),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.ENGAGEMENTCARD);
                    AppLovinProvider.instance.showInterstitial(() {});
                  },
                  child: cards_template(Color(0xFF04BDEB), Color(0xFF9FE6F6),
                      "Engagement", "Card", AppImages.engagement),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  // Graduation party color
  //  Color(0xFFBF04C3),
  //                     Color.fromARGB(255, 226, 134, 228),

  Container cards_template(
      Color color1, Color color2, String text1, String text2, String image) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                            // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                            // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.black),
                        Shadow(
                            // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.black),
                      ]),
                ),
              ),
              Text(
                text2,
                style: GoogleFonts.holtwoodOneSc(
                  textStyle: TextStyle(
                      fontSize: 60.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                            // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.black),
                        Shadow(
                            // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.black),
                        Shadow(
                            // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.black),
                      ]),
                ),
              ),
            ],
          ),
          Image.asset(
            image,
            scale: 3,
          )
        ],
      ),
    );
  }
}
