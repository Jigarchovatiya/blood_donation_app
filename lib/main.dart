import 'package:blood_donation_app/res/constants/app_colors.dart';
import 'package:blood_donation_app/utils/routes/routes.dart';
import 'package:blood_donation_app/utils/routes/routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "inter",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.materialColor),
        primaryColor: AppColors.materialColor,
        useMaterial3: false,
      ),
      // home: const CreateAccountTwo(),
      routes: appRoutes,
      initialRoute: RoutesName.splashScreen,
    );
  }
}
