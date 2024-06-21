import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/routes/app_pages.dart';
import 'package:invitation_maker/app/theme/app_theme.dart';
import 'package:invitation_maker/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  MyApp({super.key});
// observer.analytics.setAnalyticsCollectionEnabled(true);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    observer.analytics.setAnalyticsCollectionEnabled(kReleaseMode);

    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(1428, 2000),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            // theme: ThemeData(
            //   useMaterial3: true,
            // ),
            theme: lightMode,
            darkTheme: darkMode,

            debugShowCheckedModeBanner: false,

            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            // home:
          );
        });
  }
}
