import 'dart:io';
void main() {
  const double speedOfLight = 299792458.0;
  print("Enter the distance:");
  double distance = double.parse(stdin.readLineSync()!);
  double timeItTakes = distance / speedOfLight;

  print('Time for light to travel $distance meters: $timeItTakes seconds');
}