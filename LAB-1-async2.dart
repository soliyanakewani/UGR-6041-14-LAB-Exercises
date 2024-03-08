import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const String url = "https://annas-archive.org/search?index=&q=practice+makes+perfect&sort="; 
  const String savePath = 'file.txt'; 

  try {
    
    var response = await http.get(Uri.parse(url));

    
    if (response.statusCode == 200) {
     
      File(savePath).writeAsBytesSync(response.bodyBytes);
      print('File downloaded successfully!');
    } else {
      print('Failed to download file: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}