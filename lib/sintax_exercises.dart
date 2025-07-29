
void printHello() {
  print("Hello from printHello()");
}

// funcion con parametros posicionales
void greetingPositional(String name, String? title) {
  if (title != null) {
    print("Hello! $title $name!");
  } else {
    print("Hello! $name");
  }
}

// funciones con parametros nombrados
void greetingNamed({required String name, String? title}){
  if (title != null) {
    print("Hello! $title $name!");
  } else {
    print("Hello! $name");
  }
}

void main() {
  int num1 = 1;
  double num2 = 1.5;
  String message = "Hello world!";
  bool isActive = true;
  print('num1: $num1, num2: $num2, message: $message, isActive: $isActive');
  Map<String, dynamic> myMap = {
    "name": "John",
    "lastName": "Doe",
    "isActive": true,
    "age": 46,
    "contacts": ["Juan", "Mario", "Pedro"]
  };
  print('Map: name: ${myMap["name"]}, lastName: ${myMap["lastName"]}, isActive: ${myMap["isActive"]}, age: ${myMap["age"]}');

  List<String> contacts = myMap["contacts"];

  contacts.forEach((contact){
    print(contact);
  });

  List<String> games = ["Doom 1993", "Doom II", "Quake", "Doom III"];

  for(String game in games) {
    print('game: $game');
  }

  games.forEach((game) {
    print('Print way 2: $game');
  });

  printHello();
  greetingPositional("Emily", null);
  greetingPositional("Jack", "Mr.");
  print("=========================================");
  greetingNamed(name: "Jack");
  greetingNamed(title: "Mrs.", name: "Emily");
}
