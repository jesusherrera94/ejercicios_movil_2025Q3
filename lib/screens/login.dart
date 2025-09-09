import 'package:flutter/material.dart';
import '../adapters/local_storage.dart';
import '../adapters/dio_adapter.dart';
import '../widgets/wave_button.dart';
import '../models/user.dart';
import '../adapters/auth.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalStorage _localStorage = LocalStorage();
  bool _hasLoaded = false;
  final DioAdapter _dioAdapter = DioAdapter();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _email = '';
  String _password = '';
  String _error = '';

  @override
  void initState() {
    super.initState();
    loadUserDetails(context);
  }

  Future<void> loadUserDetails(BuildContext context) async {
    bool loginStatus = await _localStorage.getLoginStatus();
    setState(() {
      _hasLoaded = true;
    });
    if (loginStatus) {
      _goToMainApp(context);
    }
  }

  Future<void> doLogin(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _error = '';
        _isLoading = true;
      });
      try {
        dynamic loginUser = await Auth.signInWithEmailAndPassword(_email, _password);
        print('=====> user info: ${loginUser.user}');
        String userUid = loginUser.user.uid;
        dynamic response = await _dioAdapter.getRequest('https://subscriptions-be.vercel.app/api/users/$userUid');
        User user = User.fromMap(response['user']);
        await _localStorage.setUserData('user', user.toMapString());
      await _localStorage.setLoginStatus(true);
      _goToMainApp(context);
    } catch (e) {
      print("An error has occurred trying to login!: $e");
      setState(() {
        _error = 'An error has occurred trying to login';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    }
  }

  void _goToMainApp(BuildContext context) {
    Navigator.pushNamed(context, 'main-app');
  }

  void _goToRegister(BuildContext context) {
    Navigator.pushNamed(context, 'register');
  }

  void callbackMethod(String value) {
    print('Hola Mundo!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! $value');
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasLoaded) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/login_icon.png', width: 125.0),
                      SizedBox(height: 55.0),
                       TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Email';
                          }
                          if (!value.contains("@")) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value!,
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
                        onSaved: (value) => _password = value!,
                      ),
                      if (_error.isNotEmpty) ...[
                        SizedBox(height: 10,),
                        Text(_error, style: TextStyle(color: Colors.redAccent),)
                      ],
                      SizedBox(height: 20),
                      WaveButton(
                        onPressed: (value) {
                          if(!_isLoading){
                            doLogin(context);
                          }
                        },
                        animationDuration: Duration(milliseconds: 300),
                        waveColor: Colors.pinkAccent,
                        child: _isLoading? CircularProgressIndicator() : const Text("Login"),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          _goToRegister(context);
                        },
                        child: Text(
                          "Have a user? Register",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
