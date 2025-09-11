import 'package:flutter/material.dart';
import '../models/subscription.dart';
import 'dart:convert' as convert;
import '../models/user.dart';
import '../adapters/local_storage.dart';
import '../store/subscriptions_state.dart';
import '../adapters/db.dart';

class StoreItem extends StatelessWidget {
  final Subscription subscription;
  const StoreItem({super.key, required this.subscription});

  Future<void> _addToMySubscriptions(BuildContext context) async {
    final LocalStorage localStorage = LocalStorage();
    final userString = await localStorage.getUserData('user');
    final User user = User.fromMap(convert.jsonDecode(userString));
    final Db db = Db();
    final newSubscription = Subscription(
      id: '',
      platformName: subscription.platformName,
      renovationDate: subscription.renovationDate,
      renovationCycle: subscription.renovationCycle,
      charge: subscription.charge,
      userId: user.uid!,
      image: subscription.image,
    );
    dynamic response = await db.saveSubscription(newSubscription.toMap());
    final newSub = Subscription.fromMap({
        "id": response.id,
        ...response.data(),
      });
    subscriptionsNotifier.value = [...subscriptionsNotifier.value, newSub];
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Subscription added to your list'))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(14)),
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height *
                  0.08, // tomar el 8% del tamaño de la pantalla
              width: double
                  .infinity, // abarca todo el espacio disponible a lo ancho
              child: Image.asset(
                subscription.image ?? 'assets/img/default.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image);
                },
              ),
            ),
          ),
          Text(
            subscription.platformName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(subscription.platformName),
              SizedBox(width: 5),
              Text(
                "\$ ${subscription.charge}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cycle:"),
              SizedBox(width: 5),
              Text(subscription.renovationCycle.name),
            ],
          ),
          IconButton(
            onPressed: () { _addToMySubscriptions(context); },
            icon: Icon(Icons.add_shopping_cart, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
