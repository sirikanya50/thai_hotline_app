import 'package:flutter/material.dart';
import 'package:thai_hotline_aapp/view/splash_sceen_ui.dart';


void main() {
  runApp(const thai_hotline_app());
}
class thai_hotline_app extends StatefulWidget {
  const thai_hotline_app({super.key});

  @override
  State<thai_hotline_app> createState() => _thai_hotline_appState();
}

class _thai_hotline_appState extends State<thai_hotline_app> {
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenUI(),    
    );
  }
}