import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';
import 'screen/home_screen/view/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     title: "title",
      // theme: KAppTheme.lightTheme,
      // darkTheme: KAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
      //  translations: AppTranslations(),
      fallbackLocale: const Locale('en'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}