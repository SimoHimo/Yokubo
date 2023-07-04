import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yokubo/pages/Cart/cart_page.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}
enum ItemColor {
  black(Color(0xffb2bec3)),
  red(Color(0Xffff3838)),
  blue(Color(0xff74b9ff));

  const ItemColor(this.color);

  final Color color;
}

class _TestState extends State<Test> {
  ItemColor? selectedItem;
  @override
  Widget build(BuildContext context) {
    var stars = const Color(0xfffdcb6e);
    var black = const Color(0xff2c3e50);
    // var grey = const Color(0xfff6f4f3);
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;
    RxBool isFavorite = false.obs;
    RxInt counter = 1.obs;
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: SizedBox(
            width: width * 100,
            height: height * 150,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                    top: height*80,
                    child: Container(
                      height: 100,
                      width: width*20,
                      color: black,)),


                SizedBox(
                  height: height * 55,
                  width: width * 100,
                  child: const Image(
                      image: AssetImage('assets/images/image-jin.png')),
                ),
                Positioned(
                    top: 0,
                    child: Container(
                      height: 100,
                      width: width*20,
                      color: black,)),
                Positioned(
                    top: 0,
                    right: width * 3,
                    child: IconButton(
                        onPressed: () {
                          Get.to(() => CartPage());
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.bagShopping,
                          color: black,
                        ))),
                Positioned(
                    top: 100,
                    left: width * 3,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: black,
                        ))),
                Positioned(
                  top: height * 43,
                  right: width * 3,
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
                      height: height * 100,
                      width: width * 100,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40))),
                      child: Column(
                        children: [
                          Container(
                            width: width * 100,
                            height: height * 13,
                            padding: EdgeInsets.fromLTRB(
                                width * 5, height * 2, width * 5, 0),
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
                                      height: height * 3,
                                      width: width * 50,
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
                                          fontSize: height*3.5,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Row(
                                      children: <Widget>[

                                        CircleAvatar(

                                          backgroundColor: black,

                                          child: IconButton(onPressed: (){counter > 1
                                              ? counter.value--
                                              : null;}, icon: const Icon(Icons.remove,color: Colors.white,),),
                                        ),
                                        // InkWell(
                                        //   onTap: () {
                                        //     counter > 1
                                        //         ? counter.value--
                                        //         : null;
                                        //   },
                                        //   child: SizedBox(
                                        //     height: height * 5,
                                        //     width: width * 5,
                                        //     child: const Icon(Icons.remove),
                                        //   ),
                                        // ),
                                        SizedBox(
                                            width: width * 10,
                                            child: Center(
                                                child: Obx(
                                                      () => Text(
                                                    "$counter",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: black),
                                                  ),
                                                ))),
                                        // InkWell(
                                        //   onTap: () {
                                        //     counter < 99
                                        //         ? counter.value++
                                        //         : null;
                                        //   },
                                        //   child: SizedBox(
                                        //     height: height * 5,
                                        //     width: width * 5,
                                        //     child: const Icon(Icons.add),
                                        //   ),
                                        // ),
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
                            width: width * 100,
                            height: height * 20,
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 5),
                            //color: Colors.blue,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height * 12,
                                  width: width * 75,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("  Size",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 2.5)),
                                      CustomRadioButton(
                                        radius: height * 15,
                                        enableButtonWrap: true,
                                        enableShape: true,
                                        width: height * 5.7,
                                        height: height * 5.7,
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
                                    height: height * 18,
                                    width: width * 13,
                                    padding: EdgeInsets.symmetric(
                                        vertical: height),
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
                                                  width * 8, width * 8),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                selectedItem = item;
                                              });
                                            },
                                            child: selectedItem == item
                                                ? const Icon(Icons.check)
                                                : null,
                                          ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: width * 100,
                            height: height * 15,
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 5),
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
                                    height: height * 3,
                                  ),
                                  Text(
                                      style: GoogleFonts.poppins(
                                          color: black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                      "Reviews"),
                                  SizedBox(
                                    height: height,
                                  ),
                                  SizedBox(
                                    width: width * 90,
                                    height: height * 12,
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
                                    height: height,
                                  ),
                                  SizedBox(
                                    width: width * 90,
                                    height: height * 12,
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
                                    height: height,
                                  ),
                                  SizedBox(
                                    width: width * 90,
                                    height: height * 12,
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
    );



  }
}
