import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intertrack/Screens/Home/home_screen.dart';
import 'package:intertrack/Screens/JobApplicationDetails/job_application_details_screen.dart';
import 'package:intertrack/Utils/constant.dart';
import 'package:intertrack/Utils/pallets.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: scaffoldBGColor, // navigation bar color
      statusBarColor: scaffoldBGColor, // status bar color
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        Constant.routeJobApplicationDetails: (ctx) =>
            JobApplicationDetailsScreen(),
      },
    );
  }
}
