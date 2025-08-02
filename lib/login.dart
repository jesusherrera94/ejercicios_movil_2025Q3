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
        label: "Undo",
        onPressed: () {
          print("Revesar accion!");
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
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/login_icon.png', width: 125.0),
                  SizedBox(height: 55.0),
                  ElevatedButton(
                    onPressed: () {
                      _displaySnackbar(context, "Do login!");
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      _displaySnackbar(context, "Do register");
                    },
                    child: Text(
                      "Have a user? Register",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
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
