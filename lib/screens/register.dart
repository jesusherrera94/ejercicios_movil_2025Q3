import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import '../models/user.dart';
import '../adapters/dio_adapter.dart';
import '../adapters/local_storage.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  DioAdapter _dioAdapter = DioAdapter();
  LocalStorage _localStorage = LocalStorage();
  bool _isLoading = false;

  User _user = User(
    username: '',
    fullname: '',
    email: '',
    password: '',
    principalInterest: '',
  );

  void _goToMainApp(BuildContext context) {
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

  Future<void> onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        _user.profilePicture = 'https://example.com/profile2.jpg';
        dynamic response = await _dioAdapter.postRequest(
          'https://subscriptions-be.vercel.app/api/users',
          _user.toMap(),
        );
        User newUser = User.fromMap(response["user"]);
        await _localStorage.setUserData("user", newUser.toMapString());
        await _localStorage.setLoginStatus(true);

        // test the localstorage data!
        String userString = await _localStorage.getUserData('user');
        dynamic userMap = convert.jsonDecode(userString);
        _displaySnackbar(
          context,
          'User registered successfully: ${userMap['username']}',
        );
        _goToMainApp(context);
      } catch (e) {
        print("An error has occurred trying to create user! $e");
        _displaySnackbar(
          context,
          "An error has ocurred trying to create user!",
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create user")),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            child:
            SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0,),
                  Image.asset('assets/img/login_icon.png', width: 125.0),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Username',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the username';
                              }
                              return null;
                            },
                            onSaved: (value) => _user.username = value!,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Full name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Full name';
                              }
                              return null;
                            },
                            onSaved: (value) => _user.fullname = value!,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Email';
                              }
                              if (!value.contains("@")) {
                                return 'Please enter a valid Email';
                              }
                              return null;
                            },
                            onSaved: (value) => _user.email = value!,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            onSaved: (value) => _user.password = value!,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Your interest',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your interest';
                              }
                              return null;
                            },
                            onSaved: (value) =>
                                _user.principalInterest = value!,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!_isLoading){
                        onSubmit();
                      }
                    },
                    child: _isLoading ? CircularProgressIndicator() : Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
