import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intertrack/Controller/auth_controller.dart';
import 'package:intertrack/Debug/debug_screen.dart';
import 'package:intertrack/Screens/Auth/login_screen.dart';
import 'package:intertrack/Screens/Home/home_screen.dart';
import 'package:intertrack/Screens/JobApplicationDetails/job_application_details_screen.dart';
import 'package:intertrack/Screens/Loading/creating_user_screen.dart';
import 'package:intertrack/Utils/constant.dart';
import 'package:intertrack/Utils/pallets.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: scaffoldBGColor, // navigation bar color
      statusBarColor: scaffoldBGColor, // status bar color
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController? _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: _authController?.currentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else
            return LoginScreen();
        },
      ),
      routes: {
        Constant.routeJobApplicationDetails: (ctx) =>
            JobApplicationDetailsScreen(),
        Constant.routeDebug: (ctx) => DebugScreen(),
        Constant.routeCreatingUser: (ctx) => CreatingUserScreen(),
      },
    );
  }
}
