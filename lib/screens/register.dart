import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


   void _goToMainApp( BuildContext context) {
    _displaySnackbar(context, "User regristed successfully!");
    Navigator.pushNamed(context, 'main-app');
  }

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
      appBar: AppBar(title: Text("Create user")),
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
                      _goToMainApp(context);
                    },
                    child: Text("Register"),
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
