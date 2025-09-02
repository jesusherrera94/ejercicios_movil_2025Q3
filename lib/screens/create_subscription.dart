import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import '../models/subscription.dart';
import '../models/user.dart';
import '../adapters/local_storage.dart';

class CreateSubscription extends StatefulWidget {
  const CreateSubscription({super.key});

  @override
  State<CreateSubscription> createState() => _CreateSubscriptionState();
}

class _CreateSubscriptionState extends State<CreateSubscription> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final LocalStorage _localStorage = LocalStorage();
  late User _user;

  Subscription _newSubscription = Subscription(
    id: '',
    platformName: '',
    renovationDate: 0,
    renovationCycle: Period.NONE,
    charge: 0.0,
    userId: '',
  );

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  void dispose() {
    super.dispose();
    print('==========**** DESTROYED ****===========');
  }

  Future<void> loadUser() async {
    final userString = await _localStorage.getUserData('user');
    setState(() {
      _user = User.fromMap(convert.jsonDecode(userString));
    });
  }

  Future<void> _onCreateSubscription() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      _newSubscription.userId = _user.uid!;
      print(
        'New subscription: ${_newSubscription.platformName}, ${_newSubscription.renovationDate}, ${_newSubscription.renovationCycle}, ${_newSubscription.charge}, userId: ${_newSubscription.userId}',
      );
      print('New Subscription toMap: ${_newSubscription.toMap()}');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Subscription")),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Add the subscription info here!",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Platform',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the platform';
                          }
                          return null;
                        },
                        onSaved: (value) =>
                            _newSubscription.platformName = value!,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Renovation Date',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Renovation date';
                          }
                          return null;
                        },
                        onSaved: (value) =>
                            _newSubscription.renovationDate = int.parse(value!),
                      ),
                      DropdownButtonFormField<Period>(
                        decoration: const InputDecoration(
                          labelText: "Renovation Cycle",
                        ),
                        items: Period.values.map((Period period) {
                          return DropdownMenuItem<Period>(
                            value: period,
                            child: Text(period.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            _newSubscription.renovationCycle = value;
                          }
                        },
                        validator: (value) {
                          if (value == null || value == Period.NONE) {
                            return 'Please select a valid renovation cycle';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Charge'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Charge';
                          }
                          return null;
                        },
                        onSaved: (value) =>
                            _newSubscription.charge = double.parse(value!),
                      ),

                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (!_isLoading) {
                            _onCreateSubscription();
                          }
                        },
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text("Create Subscription"),
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
