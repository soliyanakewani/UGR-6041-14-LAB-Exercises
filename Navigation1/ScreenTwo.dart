import 'package:flutter/material.dart';





class ScreenTwo extends StatelessWidget {
   const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    // final text = 
    //      ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('exploring Navigation')),
          backgroundColor:Colors.amber,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'yes');
              
            },
            child: const Text('go back'),
            ),

          // child:ElevatedButton(
          //   child: const Text("go back"),
          //   onPressed:() => Navigator.pop(context),
          //     )
        )
          ,
    );
    
    
    
  }



}







