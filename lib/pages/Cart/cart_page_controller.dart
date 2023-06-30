import 'package:get/get.dart';

class CartPageController extends GetxController{
 var books= 0.obs;
 var pens = 0.obs;

 book_increment(){
  books < 99
      ? books.value++
      : null;
 }
 book_decrement(){
  books > 0
      ? books.value--
      : null;
}

 pen_increment(){
  pens < 99
      ? pens.value++
      : null;
 }
 pen_decrement(){
  pens > 0
      ? pens.value--
      : null;
 }
}