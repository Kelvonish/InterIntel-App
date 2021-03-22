import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:interintel/views/homepage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: SplashScreenView(
          backgroundColor: Color(0xfff7892b),
          imageSrc: "assets/name.jpeg",
          home: BottomMenuSelector(),
          duration: 3000,
          imageSize: 200,
          text: "Build and Innovate",
          textType: TextType.TyperAnimatedText,
          textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
      ),
    );
  }
}
