import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab_exercise_1/ScreenOne.dart';
import 'package:lab_exercise_1/ScreenTwo.dart';
// import 'package:lab_exercise_1/imagedisplay.dart';
// import 'package:lab_exercise_1/textcenter.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'navigation',
      initialRoute: '/',
      routes: {
        '/':(context) =>const  ScreenOne(),
        '/Second':(context) => const ScreenTwo()
      },
      debugShowCheckedModeBanner: false,
      // home: ImageDisplay(),
      // home: MainApp(),
      // home:IconDisplay (),
      //  home: TextCenter(),
        // home: const ScreenOne(),
      
     
      );
    
    
  }



}







