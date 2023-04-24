import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 24, 37, 1), // Couleur d'arrière-plan
      body: Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(255, 163, 253, 1), // Couleur du cercle de chargement
        ),
      ),
    );
  }
}
