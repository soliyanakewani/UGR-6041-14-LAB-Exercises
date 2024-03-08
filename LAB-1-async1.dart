import 'dart:async';
import 'dart:math';

void main() async {

  String quote = await fetchRandomQuote();
  
  print("Random Quote: $quote");
}

Future<String> fetchRandomQuote() async {
  await Future.delayed(Duration(seconds: 2));
  
  List<String> quotes = [
    "The purpose of our lives is to be happy. - Dalai Lama",
    "The way to get started is to quit talking and begin doing. - Walt Disney",
    "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston S. Churchill",
    "Strive not to be a success, but rather to be of value. - Albert Einstein",
    "You only live once, but if you do it right, once is enough. - Mae West",
  ];
  
  Random random = Random();
  int index = random.nextInt(quotes.length);
  
  return quotes[index];
}