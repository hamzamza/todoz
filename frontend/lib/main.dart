import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/storage.dart';
import 'screens/home/Homescreen.dart';
import 'screens/welcome/welcome_screen.dart';

void main() async {
  await dotenv.load();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(
    const MaterialApp(
      home: Main(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "todoz",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: Welcome(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  bool isAuthenticated = true;
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter auth",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        //TODO: chagne the first welcome()  wedget to the home page you have created
        body: isAuthenticated ? const Welcome() : const Welcome(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  void checkAuth() async {
    var isauth = await getStroage();

    setState(() {
      isAuthenticated = isauth != null ? true : false;
    });
  }
}
