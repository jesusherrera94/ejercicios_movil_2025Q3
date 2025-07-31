import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _displaySnackbar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Undo | deshacer',
        onPressed: () {
          print('Hola snackbar');
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/img/login_icon.png", width: 120.0),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      _displaySnackbar(context, "Do Login");
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      _displaySnackbar(context, "Go to Register");
                    },
                    child: Text("Register as new user"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
