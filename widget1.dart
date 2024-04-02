import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout_rounded),
            ),
            IconButton(
              onPressed: () {
                // Handle second action icon onPressed event
              },
              icon: Icon(Icons.settings),
            ),
          ],
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
              const SizedBox(height: 20.0),
              const Text(
                "1975 Porsche 911 Carrera",
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Essential Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "1 out of 3 done",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
               Divider( 
                thickness: 1.0, 
                color: Colors.black, 
              ),
          
            ],
          ),
             
        ),
      ),
    );
  }
}
