import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
 
  const String apiKey = 'YOUR_API_KEY';
  const String city = 'New York'; 
  
  final String apiUrl =
      'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

  try {
    
    final response = await http.get(Uri.parse(apiUrl));

    
    if (response.statusCode == 200) {
      
      final Map<String, dynamic> data = jsonDecode(response.body);

      
      final double temperature = data['main']['temp'];
      final String weatherDescription = data['weather'][0]['description'];

      
      print('Current temperature in $city: $temperature°C');
      print('Weather conditions: $weatherDescription');
    } else {
      
      print('Failed to fetch weather data: ${response.statusCode}');
    }
  } catch (e) {
    
    print('Error: $e');
  }
}