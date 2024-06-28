import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaka_calculator/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
    //This removes the top and bottom phone icons like the back buttons and the status bar on top
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    //how long the screen will be displayed before going to another page
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage())
      );
    });
  }

    @override
  void dispose(){
    //This returns the icons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // Access the color scheme from the current theme
    //final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Color.fromARGB(255, 212, 176, 78), Colors.black, Color.fromARGB(255, 212, 176, 78)],
          //   begin:Alignment.topRight,
          //   end:Alignment.bottomLeft,
          //   )
            gradient: RadialGradient(
              colors: [ Colors.black, Color.fromARGB(255, 13, 109, 15),],
              radius: 0.75,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/images/calclogo-removebg-preview.png',
              width: 300,
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}