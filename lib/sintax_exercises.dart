

void printHello() {
  print("Hello world!");
}

void greetingPositional(String name, String? title){
  if(title != null) {
    print('Hello! $title $name');
  } else {
    print('Hello! $name');
  }
}

void greetingNamed({required String name, String? title}){
  if(title != null) {
    print('Hello! $title $name');
  } else {
    print('Hello! $name');
  }
}

void main() {
  int num1 = 1;
  double num2 = 1.5;
  String message = 'Hello world!';
  print('num1: $num1, num2: $num2, message: $message');
  Map<String, dynamic> myMap = {
    "name": "John",
    "lastName": "Doe"
  };
  print('Last name: ${myMap["lastName"]}, name: ${myMap["name"]}');
  List<String> games = ['Doom 1993', "Doom II", "Quake", "Doom III"];
  for(String game in games){
    print(game);
  }
  games.forEach((game) {
    print(game);
  });
  printHello();
  greetingPositional('Jesus', null);
  greetingPositional('Roboto', 'Mr.');
  greetingNamed(name: 'JesusH');
  greetingNamed(name: 'Roboto', title: 'Mr.');
}
