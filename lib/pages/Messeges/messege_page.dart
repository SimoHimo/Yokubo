import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yokubo/test.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    List lst =[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: Card(
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 4),
                    onTap: () {
                      print(lst[index]);
                    },
                    title: Text(lst[index].toString()),
                    // leading: CircleAvatar(
                    //   backgroundImage:
                    //   AssetImage('assets/${data[index].avatar}'),
                    // ),
                  ),
                ),
              );
            }
        ),

      ),
    );

  }
}
