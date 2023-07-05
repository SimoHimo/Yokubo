import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        'notification_id': 1,
        'timestamp': '2023-06-30 10:15:00',
        'message': 'New Product Arrived: Check out our latest collection!',
      },
      {
        'notification_id': 2,
        'timestamp': '2023-06-30 12:30:00',
        'message': 'Flash Sale Alert: Get 50% off on selected items!',
      },
      {
        'notification_id': 3,
        'timestamp': '2023-06-30 14:45:00',
        'message': 'Limited Stock: Only 5 items left in stock!',
      },
      {
        'notification_id': 4,
        'timestamp': '2023-06-30 16:00:00',
        'message': 'Free Shipping Offer: Enjoy free shipping on all orders!',
      },
      {
        'notification_id': 5,
        'timestamp': '2023-06-30 18:20:00',
        'message': 'Special Discount: Use code SUMMER15 for an extra 15% off!',
      },
      {
        'notification_id': 6,
        'timestamp': '2023-06-30 20:45:00',
        'message': 'Restock Alert: Bestselling item is back in stock!',
      },
      {
        'notification_id': 7,
        'timestamp': '2023-06-30 22:10:00',
        'message': 'New Arrivals: Explore our fresh collection of accessories.',
      },
      {
        'notification_id': 8,
        'timestamp': '2023-06-30 23:30:00',
        'message': 'Deal of the Day: Save big on our featured product!',
      },
      {
        'notification_id': 9,
        'timestamp': '2023-07-01 09:00:00',
        'message': 'Last Chance: Final day of our clearance sale!',
      },
      {
        'notification_id': 10,
        'timestamp': '2023-07-01 11:30:00',
        'message': 'Exclusive Offer: Subscribe to our newsletter and get 10% off!',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Color(0xff2c3e50)),),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              var notification = notifications[index];
              var timestamp = notification['timestamp'];
              var message = notification['message'];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: Card(
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 4),
                    onTap: () {},
                    title: Text(message,style: const TextStyle(fontWeight: FontWeight.w600),),
                    subtitle: Text(timestamp.toString()),
                    leading:const Text("Notification"),
                  ),
                ),
              );
            }
        ),

      ),
    );

  }
}
