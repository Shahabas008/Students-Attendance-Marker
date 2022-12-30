import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    waitingscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children:  [
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                    Text(
                    ' STUDENT \n ATTENDANCE \n MARKER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
             const  SizedBox(height: 250),
             const  Text(
                'Created by SHANIBA, SHIYANA, ADIL & SHAHABAS.',
                style: TextStyle(
                   fontSize: 10,
                   fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void waitingscreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "loginpage");
    });
  }
}
