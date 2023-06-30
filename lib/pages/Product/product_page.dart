import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yokubo/pages/Cart/cart_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

enum ItemColor {
  black(Color(0xffb2bec3)),
  red(Color(0Xffff3838)),
  blue(Color(0xff74b9ff));

  const ItemColor(this.color);

  final Color color;
}

class _ProductPageState extends State<ProductPage> {
  ItemColor? selectedItem;

  @override
  Widget build(BuildContext context) {
    var stars = const Color(0xfffdcb6e);
    var black = const Color(0xff2c3e50);
    var grey = const Color(0xfff6f4f3);
    var percentHeight = (MediaQuery.of(context).size.height) / 100; 
    var PercentWidth = (MediaQuery.of(context).size.width) / 100;
    
    RxBool isFavorite = false.obs;
    RxInt counter = 0.obs;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: SizedBox(
              width: 100 * PercentWidth ,
              height: 150 * percentHeight ,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [


                  SizedBox(
                    height:55 * percentHeight ,
                    width: 100 * PercentWidth ,
                    child: const Image(
                        image: AssetImage('assets/images/image-jin.png')),
                  ),
                  Positioned(
                      top: 0,
                      right: 3 * PercentWidth ,
                      child: IconButton(
                          onPressed: () {
                            Get.to(() => const CartPage());
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.bagShopping,
                            color: black,
                          ))),
                  Positioned(
                      top: 0,
                      left: 3 * PercentWidth ,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: black,
                          ))),
                  Positioned(
                    top: 43 * percentHeight ,
                    right: 3 * PercentWidth ,
                    child: Obx(
                      () => IconButton(
                        onPressed: () {
                          isFavorite.toggle();
                        },
                        icon: isFavorite.value
                            ? const FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                              )
                            : FaIcon(
                                FontAwesomeIcons.heart,
                                color: black,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 100 * percentHeight ,
                        width: 100 * PercentWidth,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(40))),
                        child: Column(
                          children: [
                            Container(
                              width:  100 * PercentWidth ,
                              height:  13 * percentHeight,
                              padding: EdgeInsets.fromLTRB(
                                  5 * PercentWidth ,2 * percentHeight , 5 * PercentWidth , 0),
                              decoration: const BoxDecoration(
                                //color: Colors.black12,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Baggy Nike Air",
                                        style: GoogleFonts.poppins(
                                            color: black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Fur Elise",
                                        style: GoogleFonts.poppins(
                                            color: black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 3 * percentHeight ,
                                        width: 50 * PercentWidth,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 20,
                                              color: stars,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 20,
                                              color: stars,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 20,
                                              color: stars,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 20,
                                              color: stars,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              size: 20,
                                              color: stars,
                                            ),
                                            Text(
                                              "(69 Reviews)",
                                              style: GoogleFonts.poppins(
                                                  color: black,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "\$249",
                                        style: GoogleFonts.poppins(
                                            color: black,
                                            fontSize: percentHeight*3.5,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Row(
                                        children: <Widget>[

                                          CircleAvatar(

                                            backgroundColor: black,

                                            child: IconButton(onPressed: (){counter > 0
                                                ? counter.value--
                                                : null;}, icon: const Icon(Icons.remove,color: Colors.white,),),
                                          ),
                                          SizedBox(
                                              width: 10 * PercentWidth,
                                              child: Center(
                                                  child: Obx(
                                                () => Text(
                                                  "$counter",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: black),
                                                ),
                                              ))),
                                          CircleAvatar(


                                            backgroundColor: black,

                                            child: IconButton(onPressed: (){counter <99
                                                ? counter.value++
                                                : null;}, icon: const Icon(Icons.add,color: Colors.white,),),
                                          ),
                                        ],
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 100 * PercentWidth,
                              height: 20 * percentHeight,
                              padding:
                                  EdgeInsets.symmetric(horizontal: 5 * PercentWidth),
                              //color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 12 * percentHeight,
                                    width: 75 * PercentWidth,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("  Size",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 2.5* percentHeight)),
                                        CustomRadioButton(
                                          radius: 15 * percentHeight,
                                          enableButtonWrap: true,
                                          enableShape: true,
                                          width: 5.7 * percentHeight,
                                          height: 5.7 * percentHeight,
                                          elevation: 0,
                                          selectedColor: black,
                                          unSelectedColor: Colors.white,
                                          selectedBorderColor: Colors.white,
                                          unSelectedBorderColor:
                                              Colors.black12,
                                          buttonLables: const [
                                            "XS",
                                            "S",
                                            "M",
                                            "L",
                                            "XL",
                                          ],
                                          buttonValues: const [
                                            "S",
                                            "M",
                                            "L",
                                            "XL",
                                            "XXL"
                                          ],
                                          buttonTextStyle: ButtonTextStyle(
                                              selectedColor: Colors.white,
                                              unSelectedColor: black,
                                              textStyle: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.bold)),
                                          radioButtonValue: (value) {

                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Colors
                                  Container(
                                      height: 18 * percentHeight,
                                      width: 13 * PercentWidth,
                                      padding: EdgeInsets.symmetric(
                                          vertical: percentHeight),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 8,
                                              offset: const Offset(1, 2)),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          for (ItemColor item
                                              in ItemColor.values)
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: item.color,
                                                shape: const CircleBorder(),
                                                fixedSize: Size(
                                                    8 * PercentWidth, 8 * PercentWidth),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  selectedItem = item;
                                                });
                                              },
                                              child: selectedItem == item
                                                  ? const Icon(Icons.check,color: Colors.white,)
                                                  : null,
                                            ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              width:   100 * PercentWidth,
                              height:  15 * percentHeight,
                              padding:
                                  EdgeInsets.symmetric(horizontal:  5 * PercentWidth),
                              //color: Colors.blue,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Description",
                                    style: GoogleFonts.poppins(
                                        color: black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                      style: GoogleFonts.poppins(
                                          color: black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      "I think we all know boldness when we see it. Nothing makes me smile more than when I see someone being fully themselves, with their own individual style and character, whatever that is. \n —Angelina Jolie")
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:  3 * percentHeight,
                                ),
                                Text(
                                    style: GoogleFonts.poppins(
                                        color: black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                    "Reviews"),
                                SizedBox(
                                  height: percentHeight,
                                ),
                                SizedBox(
                                  width:   90 * PercentWidth,
                                  height:  12 * percentHeight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                          style: GoogleFonts.poppins(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          "Micheal noah"),
                                      Text(
                                          style: GoogleFonts.poppins(
                                              color: black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                          "I absolutely love this dress! The fabric is soft and comfortable, and the fit is perfect. The vibrant color and stylish design make it a standout piece in my wardrobe. I've received so many compliments whenever I wear it!")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: percentHeight,
                                ),
                                SizedBox(
                                  width:   90 * PercentWidth,
                                  height:  12 * percentHeight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                          style: GoogleFonts.poppins(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          "Trevor Noah"),
                                      Text(
                                          style: GoogleFonts.poppins(
                                              color: black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                          "I'm so glad I bought this sweater. The material is cozy and warm, perfect for the colder months. The color is versatile and goes well with many outfits. It's a great addition to my winter wardrobe and keeps me stylish and snug!")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: percentHeight,
                                ),
                                SizedBox(
                                  width:   90 * PercentWidth,
                                  height:  12 * percentHeight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                          style: GoogleFonts.poppins(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          "Noah Jordan"),
                                      Text(
                                          style: GoogleFonts.poppins(
                                              color: black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                          "I recently purchased this jacket, and I couldn't be happier with it. The quality is outstanding, and it feels so luxurious. The tailored fit and attention to detail make it a versatile piece that can be dressed up or down.")
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}