import 'package:flutter/material.dart';
import 'package:lab_exercise_1/ScreenTwo.dart';





class ScreenOne extends StatelessWidget {
   const ScreenOne({super.key});

  @override
  Widget build(BuildContext context)  {
//     final result = await Navigator.push(
//    context,
//    MaterialPageRoute(builder: (context) => const ScreenTwo()),
//  );

    return Scaffold(
      
        appBar: AppBar(
          title: const Center(
            child: Text('exploring Naviagtion')),
          backgroundColor:Colors.amber,
        ),
        body: Center(
          child:ElevatedButton(
            child:  const Text("next"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ScreenTwo(),
                  settings: const RouteSettings(arguments: "here is the info ")
                ),
              );
            },
          ),
    )
    );
      
    
    
  }



}







