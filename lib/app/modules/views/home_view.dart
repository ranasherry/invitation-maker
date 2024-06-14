import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/routes/app_pages.dart';
import 'package:invitation_maker/app/utills/images.dart';
import 'package:invitation_maker/app/utills/size_config.dart';

class HomeView extends StatelessWidget {
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
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.WEDDINGINVITEHOME);
                  },
                  child: cards_template(
                      Color(0xFF03BAE2),
                      Color.fromARGB(255, 111, 199, 219),
                      "Wedding Card",
                      AppImages.wedding),
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
                  },
                  child: cards_template(
                      Color(0xFFBF04C3),
                      Color.fromARGB(255, 226, 134, 228),
                      "Graduation party",
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
                  },
                  child: cards_template(
                      Color(0xFF0377E2),
                      Color.fromARGB(255, 91, 155, 214),
                      "Party Card",
                      AppImages.party),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.ANNIVERSARYINVITATION);
                  },
                  child: cards_template(
                      Color.fromARGB(255, 18, 3, 226),
                      Color.fromARGB(255, 91, 103, 214),
                      "Anniversary Card",
                      AppImages.anniversary),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.WEBSCRAPER);
                  },
                  child: cards_template(
                      Color(0xFF7E51FF),
                      Color.fromARGB(255, 161, 134, 238),
                      "Baby Shower",
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
                  },
                  child: cards_template(
                      Color(0xFF03E284),
                      Color.fromARGB(255, 107, 219, 173),
                      "Engagement Card",
                      AppImages.engagement),
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
      Color color1, Color color2, String text, String image) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text,
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.bold)),
          Image.asset(
            image,
            // scale: 1.33,
          )
        ],
      ),
    );
  }
}
