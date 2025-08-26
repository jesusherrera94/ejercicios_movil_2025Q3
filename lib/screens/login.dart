import 'package:flutter/material.dart';
import '../adapters/local_storage.dart';
import '../adapters/dio_adapter.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final LocalStorage _localStorage = LocalStorage();
  bool _hasLoaded = false;
  final DioAdapter _dioAdapter = DioAdapter();

  @override
  void initState() {
    super.initState();
    loadUserDetails(context);
  }

  Future<void> loadUserDetails(BuildContext context) async {
    bool loginStatus = await _localStorage.getLoginStatus();
    dynamic response = await _dioAdapter.getRequest('https://official-joke-api.appspot.com/random_ten');

    print('=====================> ${response}');

    print("RUNTIME TYPE =======================> ${response.runtimeType}");

    setState(() {
      _hasLoaded = true;
    });
    if (loginStatus) {
      _goToMainApp(context);
    }
  }

  Future<void> doLogin(BuildContext context) async {
    try {
      await _localStorage.setLoginStatus(true);
      _goToMainApp(context);
    } catch (e) {
      print("An error has occurred trying to login!: $e");
    }
  }
  
  void _goToMainApp(BuildContext context) {
    Navigator.pushNamed(context, 'main-app');
  }

  void _goToRegister(BuildContext context) {
    Navigator.pushNamed(context, 'register');
  }


  @override
  Widget build(BuildContext context) {
    if (!_hasLoaded){ return Scaffold( body: Center(child: CircularProgressIndicator(),),);}
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
                      doLogin(context);
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      _goToRegister(context);
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
