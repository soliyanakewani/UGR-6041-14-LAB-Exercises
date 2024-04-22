import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterModel extends ChangeNotifier{
   int _counter = 0;

   int get counter => _counter;

  void increment() {
     _counter++;
    notifyListeners();
    }
  
  void decrement() {
    _counter--;
    notifyListeners();
    }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});


  final String title;


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text("demo demo demo"),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterModel>(
              builder: (context, counterModel, child){
                return Text(
                 '${counterModel.counter}',
                 style: Theme.of(context).textTheme.headlineMedium, 
                );

            },
            ),
          ],
        ),
      ),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton(
         onPressed: () {Provider.of<CounterModel>(context, listen: false).decrement();},
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
       const SizedBox(width: 10),
       FloatingActionButton(
        onPressed: () {Provider.of<CounterModel>(context, listen: false).increment();},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
         ],
       ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
