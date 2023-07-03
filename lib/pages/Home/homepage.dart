import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yokubo/pages/Home/model_class.dart';
import 'package:yokubo/pages/Product/product_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Products>productlist = [];

  Future getProducts() async {
    var response = await http.get(Uri.https('dummyjson.com', '/products'));
    var jsonData = jsonDecode(response.body);
    for (var eachproduct in jsonData['products']) {
      var product = Products(
          id: eachproduct['id'],
          title: eachproduct['title'],
          description: eachproduct['description'],
          price: eachproduct['price'],
          discountPercentage: eachproduct['discountPercentage'],
          //rating: eachproduct['rating'],
          stock: eachproduct['stock'],
          brand: eachproduct['brand'],
          category: eachproduct['category'],
          thumbnail: eachproduct['thumbnail'],
          images: eachproduct['images']);
      productlist.add(product);
    }
    productlist.remove(productlist[2]);
  }


  @override
  Widget build(BuildContext context) {
    var darkwhite = const Color(0xfff6f4f3);
    var black = const Color(0xff2c3e50);
    var height = (MediaQuery
        .of(context)
        .size
        .height) / 100;
    var width = (MediaQuery
        .of(context)
        .size
        .width) / 100;

    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Catagory,Profile
              SizedBox(
                height: height * 8,
                width: width * 90,
                //color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        bottom: height,
                        child: InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            height: height * 4.8,
                            width: height * 4.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: black),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.bars,
                                size: height * 2.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        right: 0,
                        bottom: height,
                        child: Container(
                            height: height * 5,
                            width: height * 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: black),
                            child: PopupMenuButton<Menu>(
                                icon: FaIcon(
                                  FontAwesomeIcons.userAstronaut,
                                  size: height * 2.8,
                                  color: Colors.white,
                                ),
                                offset: const Offset(0, 40),
                                onSelected: (Menu item) {},
                                itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<Menu>>[
                                  const PopupMenuItem<Menu>(
                                    value: Menu.itemOne,
                                    child: Text('Account'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.itemTwo,
                                    child: Text('Settings'),
                                  ),
                                  const PopupMenuItem<Menu>(
                                    value: Menu.itemThree,
                                    child: Text('Switch'),
                                  ),
                                ]))
                      // FaIcon(FontAwesomeIcons.userAstronaut,size: height*2.8,color: Colors.white,),
                    ),
                  ],
                ),
              ), //Catagory,Profile






              //Wellcome Text
              Container(
                  height: height * 15,
                  width: width * 90,
                  //color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, height * 3, 0, height * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("YOKUBO",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: height * 3.8,
                                fontWeight: FontWeight.w800,
                                color: black),
                          )),
                      Text("Shop Your Desire",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: height * 2.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ))
                    ],
                  )),






              //Search
              Container(
                  height: height * 10,
                  width: width * 100,
                  //color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(
                      width * 5, height * 0, width * 5, height * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 6,
                        width: width * 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: darkwhite),
                        child: TextField(
                          onChanged: (value) {
                          },
                          decoration: InputDecoration(
                            hintText: "Search Here",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.search),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: height * 6,
                          width: height * 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: black),
                          child: Center(
                              child: FaIcon(FontAwesomeIcons.sliders,
                                  color: Colors.white, size: height * 2.8)),
                        ),
                      )
                    ],
                  )),






              //Carousel Slider
              Container(
                height: height * 23,
                width: width * 100,
                padding:
                EdgeInsets.fromLTRB(width * 5, height * 1, 0, height * 1),
                child: FutureBuilder(
                  future: getProducts(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState ==ConnectionState.done){
                      return CarouselSlider.builder(
                          itemCount: productlist.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const ProductPage(), arguments: index);
                              },
                              child: Container(
                                width: width * 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: black.withOpacity(0.7),
                                      image: DecorationImage(image: NetworkImage("${productlist[index].images[2]}"), fit: BoxFit
                                          .cover),
                                ),
                                //child: Center(child: Text("index: $index")),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            padEnds: false,

                          ));
                    }

                    else{return const Center(child: CircularProgressIndicator());}

                  },
                )
              ),






              //New Arrival
              SizedBox(
                height: height * 5,
                width: width * 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("New Arivals",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: black),
                        )),
                    Text("View All",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black),
                        )),
                  ],
                ),
              ), //New Arrival






              //GridView
              SizedBox(
                height: height * 425,
                child: FutureBuilder(
                    future: getProducts(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: width * 5),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: productlist.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: width * 3,
                              mainAxisSpacing: width * 3,
                              childAspectRatio: 0.75),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const ProductPage(), arguments: index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: black,width: 5),
                                  color: black,
                                ),
                                child: Padding(
                                  padding:EdgeInsets.symmetric(horizontal:2,vertical: 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(

                                        image: DecorationImage(image: NetworkImage("${productlist[index].images[0]}"), fit: BoxFit
                                            .cover),
                                          borderRadius: BorderRadius.circular(18),

                                      ),
                                      height: 175,
                                        width: 200,

                                      ),
                                      Text("${productlist[index].title}",style: TextStyle(color: Colors.white,fontSize: 18,overflow:TextOverflow.ellipsis ,fontWeight: FontWeight.bold),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Brand:${productlist[index].brand}",style: TextStyle(color: Colors.white),),
                                          Text("Price:\$${productlist[index].price}",style: TextStyle(color: Colors.white),),

                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ),
                            );
                          },
                        );//Gridview
                      }
                      else{return const Center(child:CircularProgressIndicator());}
                    }

                )
              ) //Bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawer() =>
      Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _menuItems
                .map((item) =>
                ListTile(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  title: Text(item,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black45),
                      )),
                ))
                .toList(),
          ),
        ),
      );
}
enum Menu { itemOne, itemTwo, itemThree }

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];
















