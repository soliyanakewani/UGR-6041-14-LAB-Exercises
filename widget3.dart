import 'package:flutter/material.dart';



class Widget3  extends StatelessWidget {
  const Widget3 ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.purple,
        ),
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text for BMI
              Container(
                color: Colors.blue,
                child: Text(
                  'BMI',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),

              // Row for Gender
              Container(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Column(
                      children: [
                        const Icon(Icons.male, color: Colors.white),

                    const Text(
                      'MALE',
                      style: TextStyle(color: Colors.white),
                    ),
                    Radio(
                      value: 'male',
                      groupValue: 'gender',
                      onChanged: (value) {},
                    ),
                    Text(
                      'FEMALE',
                      style: TextStyle(color: Colors.white),
                    ),
                    Radio(
                      value: 'female',
                      groupValue: 'gender',
                      onChanged: (value) {},
                    ),
                      ]
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Slider for Height
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text(
                      'HEIGHT (cm)',
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: 170.0,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Row for Weight and Age
              Container(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'WEIGHT (kg)',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 20),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'AGE',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // Calculate Button
              Container(
                color: Colors.blue,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: Container(
            height: 50.0,
          ),
        ),
      ),
    );
  }
}