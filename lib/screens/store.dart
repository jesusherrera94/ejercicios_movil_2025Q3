import 'package:flutter/material.dart';
import '../models/subscription.dart';
import '../widgets/store_items.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {

  final List<Subscription> _subscriptions = [
    Subscription(
      id: '1',
      platformName: 'Netflix',
      renovationDate: 2148483647,
      renovationCycle: Period.MONTHLY,
      charge: 12.99,
      userId: '',
      image: 'assets/img/netflix.webp',
    ),
    Subscription(
      id: '2',
      platformName: 'Spotify',
      renovationDate: 2147483647,
      renovationCycle: Period.MONTHLY,
      charge: 9.99,
      userId: '',
      image: 'assets/img/spotify.webp',
    ),
    Subscription(
      id: '3',
      platformName: 'Hulu',
      renovationDate: 2147483647,
      renovationCycle: Period.MONTHLY,
      charge: 7.99,
      userId: '',
      image: 'assets/img/hulu.webp',
    ),
    Subscription(
      id: '4',
      platformName: 'Amazon Prime',
      renovationDate: 2147483647,
      renovationCycle: Period.YEARLY,
      charge: 119.00,
      userId: '',
      image: 'assets/img/prime.webp',
    ),
    Subscription(
      id: '5',
      platformName: 'YouTube Premium',
      renovationDate: 2047483635,
      renovationCycle: Period.MONTHLY,
      charge: 11.99,
      userId: '',
      image: 'assets/img/youtube.webp',
    ),
    Subscription(
      id: '6',
      platformName: 'Github Copilot',
      renovationDate: 2047483635,
      renovationCycle: Period.YEARLY,
      charge: 100.00,
      userId: '',
      image: 'assets/img/copilot.png',
    ),
    Subscription(
      id: '7',
      platformName: 'Github Copilot',
      renovationDate: 2047483635,
      renovationCycle: Period.MONTHLY,
      charge: 12.00,
      userId: '',
      image: 'assets/img/copilot.png',
    ),
  ];

  List<Widget> _renderItems() {
    List<Widget> storeSubscriptionItems = [];
    for( final subscription in _subscriptions) {
      storeSubscriptionItems.add(StoreItems(subscription: subscription));
    }
    return storeSubscriptionItems;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      children: _renderItems(),
    );
  }
}
