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
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Books",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox(),),
                  IconButton(
                    onPressed: () {
                      c.book_increment();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black45,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    color: Colors.grey,
                    child: Center(
                        child: Obx(() => Text("${c.books.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30)))),
                  ),
                  IconButton(
                    onPressed: () {
                      c.book_decrement();
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Pens",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox(),),
                  IconButton(
                    onPressed: () {
                      c.pen_increment();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black45,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    color: Colors.grey,
                    child: Center(
                        child: Obx(() => Text("${c.pens.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30)))),
                  ),
                  IconButton(
                    onPressed: () {
                      c.pen_decrement();
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: (){}, child: Text("Pay",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),))
            ],
          )),
    );
  }
}
