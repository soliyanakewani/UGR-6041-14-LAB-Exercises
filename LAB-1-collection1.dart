void main() {
  List<String> favoriteHobbies = ['sleeping', 'eating', 'napping'];
  
  
  favoriteHobbies.add('poems');
  print('Added a new hobby: $favoriteHobbies');
  
 
  favoriteHobbies.remove('Drawing');
  print('Removed a hobby: $favoriteHobbies');
  
  
  favoriteHobbies.sort();
  print('Sorted hobbies: $favoriteHobbies');
  
  
  if (favoriteHobbies.isEmpty) {
    print('No favorite hobbies');
  } else {
    print('Favorite hobbies exist');
  }
}