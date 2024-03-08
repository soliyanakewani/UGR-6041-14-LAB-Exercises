class Person {
  String name;
  int age;
  String address;


  Person(this.name, this.age, this.address);

  void displayInfo() {
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
  }
}

void main() {

  Person person1 = Person('soliyana', 21, 'gelan');
  Person person2 = Person('daglas', 24, 'gelan');


  print('Before modification:');
  person1.displayInfo();


  person1.age = 26;
  person1.address = '4 kilo';

  print('\nAfter modification:');
  person1.displayInfo();


  print('\nInformation for the second person:');
  person2.displayInfo();
}