import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskly/app_constants.dart';
import 'package:taskly/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() async {
    Timer(const Duration(seconds: kSplashDurationInSeconds), () {
      navigateToHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image(
            image: AssetImage('assets/images/app-logo.png'),
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Manage your task with Taskly',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
