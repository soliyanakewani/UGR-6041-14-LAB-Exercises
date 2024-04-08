import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp( const MainApp());
}

class MainApp extends StatelessWidget {
   const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      class Course {
 String code;
 String title;
 String description;
 Course({required this.code, 
         required this.title,  
         this.description = ""});
}

     
      
     
      );
    
    
  }



}







