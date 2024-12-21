import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todo/view/button_notif.dart';
import 'controller/const_controller/bloc.dart';
import 'core/class/awesome_notifications.dart';
import 'core/shared/colors.dart';
import 'view/screen/layout/layout.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tajawal',
        primaryColor: createMaterialColor(ProjectColors.mainColor),
        colorScheme: ColorScheme.fromSeed(seedColor: ProjectColors.mainColor , ),
        appBarTheme: AppBarTheme(
          foregroundColor: ProjectColors.whiteColor
        ),
        useMaterial3: true,

      ),
      home: Layout(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:  [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale("ar"),
    );
  }
}
