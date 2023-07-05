import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Cart/cart_page_controller.dart';
import 'package:yokubo/pages/Cart/cart_total.dart';
import 'package:yokubo/pages/Home/model_class.dart';

class CartPage extends StatelessWidget {
  final CartPageController controller = Get.find();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xff2c3e50)),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 1000,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemCount: controller.productsmap.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: CartProductCard(
                        controller: controller,
                        products: controller.productsmap.keys.toList()[index],
                        quantity: controller.productsmap.values.toList()[index],
                        index: index,
                      ),
                    );
                  }),
            ),

            Positioned(
              height: 70,
              width: 1000,
              bottom: 0,
              child: CartTotal(),)
          ],
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartPageController controller;
  final Products products;
  final int quantity;

  final int index;

  const CartProductCard(
      {super.key,
      required this.controller,
      required this.products,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        //border: Border.all(color: black, width: 5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      height: 100,
      child: Row(
        children: [
          //Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("${products.images[0]}"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(18),
            ),
            height: 100,
            width: 90,
          ),

          //Texts
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    products.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    "\$${products.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
          ),
          //Buttons
          SizedBox(
            width: 105,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      controller.removeProduct(products);
                    },
                    icon: const FaIcon(FontAwesomeIcons.circleMinus)),
                Text("$quantity"),
                IconButton(
                    onPressed: () {
                      controller.addProduct(products);
                    },
                    icon: const FaIcon(FontAwesomeIcons.circlePlus)),
              ],
            ),
          )
        ],
      ),
    );
  }
}


