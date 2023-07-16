import 'package:flutter/material.dart';
import 'package:flutter_project_1/page/my_home_page.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State <SplashScreen> createState() =>  SplashScreenState();
}

class  SplashScreenState extends State <SplashScreen> {
   @override
  void initState(){
    super.initState();
  Timer(const Duration(seconds: 2),
          ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
    (BuildContext context)=>const MyHomePage(title: 'Flutter Demo',))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
     child: Image.asset('assets/images/ticket.png'),
     
     
    ));
  }
}

