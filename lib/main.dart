import 'package:bjp_app/ui/home.dart';
import 'package:bjp_app/ui/splash.dart';
import 'package:bjp_app/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.pref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bjp App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: // SplashScreen()
          Constants.pref.getBool("loggedIn") == true
              ? Home(isVoter: Constants.pref.getBool("voter"))
              : SplashScreen(),
    );
  }
}
