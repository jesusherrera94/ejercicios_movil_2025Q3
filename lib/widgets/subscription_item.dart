import 'package:flutter/material.dart';
import '../models/subscription.dart';
import '../utils/time_utils.dart';

class SubscriptionItem extends StatelessWidget {
  final Subscription subscriptionItem;
  const SubscriptionItem({super.key, required this.subscriptionItem});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(subscriptionItem.icon),
        title: Row(
          children: [
            Text(subscriptionItem.platformName),
            SizedBox(width: 5),
            Text(
              "\$ ${subscriptionItem.charge}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text("Period:", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text(subscriptionItem.renovationCycle.name),
              ],
            ),
            Row(
              children: [
                Text(
                  "Next renovation date:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(timestampToDatestring(subscriptionItem.renovationDate)),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: const Color.fromARGB(255, 205, 61, 61),
          ),
        ),
      ),
    );
  }
}
