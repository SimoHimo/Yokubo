import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Cart/cart_page_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartPageController c = Get.put(CartPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Color(0xff2c3e50)),),),
      body: Container(
          //padding: EdgeInsets.all(32),
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15),
              physics: BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context,i){

                return ListTile(
                    visualDensity: VisualDensity(vertical: 4),
                    onTap: () {
                      print("");
                    },
                    leading: const Icon(Icons.list),
                    trailing: const Text(
                      "GFG",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List item "));


              }),
    ));
  }
}
