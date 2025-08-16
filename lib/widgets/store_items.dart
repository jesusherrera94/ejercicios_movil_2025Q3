import 'package:flutter/material.dart';
import '../models/subscription.dart';

class StoreItems extends StatelessWidget {
  final Subscription subscription;

  const StoreItems({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Match card's top border
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.asset(
                subscription.image ?? 'assets/img/default.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/img/default.jpg',
                    fit: BoxFit.cover,
                  );
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
          Text('Cycle: ${subscription.renovationCycle.name}'),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.blueAccent,),
            onPressed: () {
              // Handle add to cart action
            },
          ),
        ],
      ),
    );
  }
}
