import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon:  Icon(Icons.arrow_back),
              ),
            actions:  [
            IconButton(
              onPressed: () {},
              icon:  Icon(Icons.logout_rounded),
              ),
            IconButton(
              onPressed: () {
                // Handle second action icon onPressed event
              },
              icon: Icon(Icons.settings),
            ),
            ]
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset( 
            'lib/assets/red.jpg',
            fit: BoxFit.cover,
            height: 300,
            
          ),
          const  Text(
            "1975 poersche 911 carrera",
            style:TextStyle(fontSize: 30.0) ,
          ),
          const Row(
            children: [
              Text("essential information",
              style:TextStyle(fontWeight: FontWeight.bold),)
            ],
          )

          
            ],

          )
         
            
         
          
          

          

         
        )
          ),
      );
  
  
  }
}