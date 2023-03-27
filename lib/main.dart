// ignore_for_file: prefer_const_constructors

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laurine_shop/pages/connexion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laurine',
      theme: FlexThemeData.light(
        scheme: FlexScheme.bahamaBlue,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.acme(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: GoogleFonts.acme(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        scaffoldBackground: Colors.blue.shade50,
        subThemesData: FlexSubThemesData(
          appBarCenterTitle: true,
          // appBarBackgroundSchemeColor: SchemeColor.,
        ),
        // appBarStyle: FlexAppBarStyle.scaffoldBackground,
        // appBarBackground: Colors.transparent,
        appBarElevation: 0,
        appBarOpacity: 0,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.hippieBlue,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.acme(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.acme(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: ConnexionPage(),
    );
  }
}
