import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/routes/app_pages.dart';
import 'package:invitation_maker/app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
