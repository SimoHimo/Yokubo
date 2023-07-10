import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yokubo/pages/Cart/paying_page.dart';
import 'cart_page_controller.dart';

class CartTotal extends StatelessWidget {
  final CartPageController controller = Get.find();
  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.productsmap.isNotEmpty?


    SizedBox(
      width: 50,
      //padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Total:  ${controller.total}",
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22,color: Color(0xff2c3e50),),
          ),
          InkWell(
            onTap: (){()=>Get.to(const ToPay());
            controller.productsmap.clear();},
            child: Container(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  color: Color(0xff2c3e50),
              ),
              child: Center(child: Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),),
            ),
          )
        ],
      ),
    )


        :


    Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 3.0, //extend the shadow
            offset: const Offset(
              0.0, // Move to right 10  horizontally
              -5.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Total:  ",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
          ),
          Text(
            "0",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
          ),
          SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }
}