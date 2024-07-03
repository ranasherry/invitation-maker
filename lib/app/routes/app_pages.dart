import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/binding/anniversary_binding.dart';
import 'package:invitation_maker/app/modules/anniversary_invite/views/anniversary_homeview.dart';
import 'package:invitation_maker/app/modules/baby_shower/binding/baby_shower_binding.dart';
import 'package:invitation_maker/app/modules/baby_shower/views/baby_shower_home.dart';
import 'package:invitation_maker/app/modules/binding/home_view_binding.dart';
import 'package:invitation_maker/app/modules/binding/settings_view_binding.dart';
import 'package:invitation_maker/app/modules/birthday_invite/binding/birthday_invite_binding.dart';
import 'package:invitation_maker/app/modules/birthday_invite/views/birthday_invite_home.dart';
import 'package:invitation_maker/app/modules/engagement_card/binding/engagement_card_binding.dart';
import 'package:invitation_maker/app/modules/engagement_card/views/engagement_card_home.dart';
import 'package:invitation_maker/app/modules/general_card/views/general_card_home.dart';
import 'package:invitation_maker/app/modules/graduation_announcement/views/graduation_announcement_home.dart';
import 'package:invitation_maker/app/modules/graduation_party/binding/graduation_party_binding.dart';
import 'package:invitation_maker/app/modules/graduation_party/views/graduation_party_home.dart';
import 'package:invitation_maker/app/modules/holiday_card/views/holiday_card_home.dart';
import 'package:invitation_maker/app/modules/party_card/binding/party_card_binding.dart';
import 'package:invitation_maker/app/modules/party_card/views/party_card_home.dart';
import 'package:invitation_maker/app/modules/splash_screen.dart/binding/splash_binding.dart';
import 'package:invitation_maker/app/modules/splash_screen.dart/view/splash_screen.dart';
import 'package:invitation_maker/app/modules/views/home_view.dart';
import 'package:invitation_maker/app/modules/views/settings_screen_view.dart';
// import 'package:invitation_maker/app/modules/web_scrapper_testing/binding/web_scrapper_binding.dart';
// import 'package:invitation_maker/app/modules/web_scrapper_testing/views/web_scrapper_view.dart';
import 'package:invitation_maker/app/modules/wedding_invite/binding/wedding_invite_binding.dart';
import 'package:invitation_maker/app/modules/wedding_invite/views/wedding_invite_home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOMEVIEW,
      page: () => HomeView(),
      binding: HomeViewBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGSVIEW,
      page: () => SettingsView(),
      binding: SettingsViewbinding(),
    ),
    GetPage(
      name: _Paths.WEDDINGINVITEHOME,
      page: () => WeddingInviteHome(),
      binding: WeddingInviteBinding(),
    ),
    GetPage(
      name: _Paths.BIRTHDAYINVITEHOME,
      page: () => BirthdayInviteHome(),
      binding: BirthdayInviteBinding(),
    ),
    GetPage(
      name: _Paths.GRADUATIONPARTYHOME,
      page: () => GraduationPartyeHome(),
      binding: GraduationPartyBinding(),
    ),
    GetPage(
      name: _Paths.ANNIVERSARYINVITATION,
      page: () => AnniversaryHomeView(),
      binding: AnniversaryBinding(),
    ),
    GetPage(
      name: _Paths.PARTYCARDHOME,
      page: () => PartyCardHome(),
      binding: partyCardBinding(),
    ),
    GetPage(
      name: _Paths.ENGAGEMENTCARD,
      page: () => engagementCardHomeView(),
      binding: engagementCardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BABYSHOWER,
      page: () => BabyShowerHome(),
      binding: babyShowerBinding(),
    ),
    GetPage(
      name: _Paths.GRADUATIONANNOUNCEMENT,
      page: () => GraduationAnnouncementHome(),
      // binding: (),
    ),
    GetPage(
      name: _Paths.HOLIDAYCARD,
      page: () => HolidayCardHome(),
      // binding: (),
    ),
     GetPage(
      name: _Paths.GENERALCARD,
      page: () => GeneralCardHome(),
      // binding: (),
    ),
    // GetPage(
    //   name: _Paths.WEBSCRAPER,
    //   page: () => WebScraper(),
    //   binding: WebScrapperBinding(),
    // ),
  ];
}
