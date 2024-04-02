import 'package:flutter/material.dart';



class Widget2 extends StatelessWidget {
  const Widget2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Cart items list
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: <Widget>[
                          // +/- buttons
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                // Implement logic to decrease quantity
                              },
                            ),
                          ),
                          SizedBox(width: 16.0),
                          // Image
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(getImageUrl(index)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          // Title, description, and price
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  getTitle(index),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  getDescription(index),
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '\$${getPrice(index)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Spacer
                          Spacer(),
                          // Quantity
                          Text(
                            '1', // Replace with quantity logic
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                // Implement logic to increase quantity
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Subtotal, tax, and checkout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Subtotal'),
                  Text('\$${60.98}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('TAX (10.0%)'),
                  Text('\$${6.10}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Checkout'),
                  Text('\$${67.08}'),
                ],
              ),
              SizedBox(height: 16.0),
              // Checkout button
              ElevatedButton(
                onPressed: () {
                  // Implement checkout logic
                },
                child: const Text('Checkout',
                style: TextStyle(color: Colors.red),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTitle(int index) {
    if (index == 0) {
      return 'Calas';
    } else {
      return 'Angel Hair';
    }
  }

  String getDescription(int index) {
    if (index == 0) {
      return '';
    } else {
      return 'Salmon, Mozzarella';
    }
  }

  double getPrice(int index) {
    if (index == 0) {
      return 15.00;
    } else {
      return 22.99;
    }
  }

  String getImageUrl(int index) {
    if (index == 0) {
      return 'https://via.placeholder.com/150'; // Placeholder image URL
    } else {
      return 'https://via.placeholder.com/150'; // Placeholder image URL
    }
  }
}