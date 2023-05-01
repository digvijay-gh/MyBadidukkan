import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybadidukkan/cartscreen/cart_screen.dart';

import 'menuscreen/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      title: 'Flutter Demo',
      home: const MenuScreen(),
    );
  }
}
