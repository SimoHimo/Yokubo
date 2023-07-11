import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yokubo/pages/Home/model_class.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yokubo/pages/Product/product_page.dart';
import 'package:http/http.dart' as http;
import 'package:yokubo/pages/Profile/about_page.dart';
import 'package:yokubo/pages/Profile/profile_page.dart';
import 'package:yokubo/pages/Profile/settings_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  List<Products> productlist = [];

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
          rating: eachproduct['rating'],
          stock: eachproduct['stock'],
          brand: eachproduct['brand'],
          category: eachproduct['category'],
          thumbnail: eachproduct['thumbnail'],
          images: eachproduct['images']);
      productlist.add(product);
      searchList.add(product);
    }
    productlist.remove(productlist[2]);
  }


  final searchController = TextEditingController();
  List<Products> searchList = [];

  bool titleSearch = true;

   setTitleSearch(bool x){
    setState(() {
      titleSearch=x;
    });
  }
  void updateSearchList(String value) {
    if(titleSearch){
      setState(
              () {
      searchList = searchList
          .where((element) =>
          element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    }
    else{
      setState(
              () {
            searchList = searchList
                .where((element) =>
                element.category.toLowerCase().contains(value.toLowerCase()))
                .toList();
          });
    }
  }


  void launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var darkWhite = const Color(0xfff6f4f3);
    var black = const Color(0xff2c3e50);
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;

    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        //<Drawer>
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: darkWhite,
          child: ListView(
            children: [
              Container(
                height: 250,
                child: Image(image: AssetImage("assets/images/bglesslogo.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50,left: 30),
                child: ListTile(
                  title: const Text('Contact us', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    launchURL(Uri.parse(
                        "mailto:syedmishkatulhaque@gmail.com?subject=regarding Yokubo App"));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ListTile(

                  title: const Text('About Us', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    launchURL(Uri.parse(
                        'https://www.linkedin.com/in/syed-mishkatul-haque/'));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ListTile(
                  title:
                      const Text('Source Code', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    launchURL(Uri.parse('https://github.com/SimoHimo/Yokubo'));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ListTile(
                  title: const Text("Sign out"),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  iconColor: black,
                ),
              )
            ],
          ),
        ), //</Drawer>

        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //  <TopBar>
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

                        //Popup Menu
                        Positioned(
                            right: 0,
                            bottom: height,
                            child: Container(
                                height: height * 5,
                                width: height * 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: black),
                                child: PopupMenuButton(
                                  icon: const FaIcon(
                                    FontAwesomeIcons.userAstronaut,
                                    color: Colors.white,
                                  ),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(() => const ProfilePage());
                                          },
                                          child: const Text("profile"),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(() => const SettingsPage());
                                          },
                                          child: const Text("Settings"),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(() => AboutPage());
                                          },
                                          child: const Text("About"),
                                        ),
                                      ),
                                    ];
                                  },
                                ))),
                        //Popup Menu
                      ],
                    ),
                  ),
                  //  </TopBar>

                  //  <Welcome Text>
                  Container(
                      height: height * 15,
                      width: width * 90,
                      //color: Colors.white,
                      padding:
                          EdgeInsets.fromLTRB(0, height * 3, 0, height * 2),
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
                  //  </Welcome Text>

                  //  <Search>
                  SizedBox(
                    height: height * 10,
                    width: width * 100,
                  ),
                  //  </Search>

                  //  <Carousel Slider>
                  Container(
                      height: height * 23,
                      width: width * 100,
                      padding: EdgeInsets.fromLTRB(
                          width * 5, height * 1, 0, height * 1),
                      child: FutureBuilder(
                        future: getProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CarouselSlider.builder(
                                itemCount: productlist.length,
                                itemBuilder: (context, index, realIndex) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => const ProductPage(),
                                          arguments: productlist[index]);
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${productlist[index].images[0]}',
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: width * 70,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  autoPlay: false,
                                  padEnds: false,
                                ));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )),
                  //  </Carousel Slider>

                  //  <New Arrival>
                  SizedBox(
                    height: height * 5,
                    width: width * 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("New Arrivals",
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
                  //  </New Arrival>

                  //  <GridView>
                  SizedBox(
                      height: height * 360,
                      child: FutureBuilder(
                          future: getProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return GridView.builder(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width * 5),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: productlist.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: width * 3,
                                        mainAxisSpacing: width * 3,
                                        childAspectRatio: 0.70),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => const ProductPage(),
                                          arguments: productlist[index]);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          //border: Border.all(color: black, width: 5),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10.0,
                                              // soften the shadow
                                              spreadRadius: 5.0,
                                              //extend the shadow
                                              offset: Offset(
                                                5.0,
                                                // Move to right 10  horizontally
                                                5.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2, vertical: 2),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    '${productlist[index].images[0]}',
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  height: 175,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      productlist[index].title,
                                                      style: TextStyle(
                                                        color: black,
                                                        fontSize: 18,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Text(
                                                      "\$${productlist[index].price}",
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 20,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              ); //Gridview
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          })) //Bottom
                  //  </GridView>
                ],
              ),
              Positioned(
                top: height * 23,
                child: Container(
                    height: height * 100,
                    width: width * 100,
                    //color: Colors.yellow,
                    padding: EdgeInsets.fromLTRB(
                        width * 5, height * 0, width * 5, height * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 45,
                            width: width * 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FloatingSearchBar(
                              clearQueryOnClose: true,
                              iconColor: Colors.black45,
                              backdropColor: Colors.white12,
                              height: height * 6,
                              width: width * 75,
                              hint: 'Search...',
                              backgroundColor: Colors.white,
                              //scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              transitionCurve: Curves.easeInOut,
                              physics: const BouncingScrollPhysics(),
                              debounceDelay: const Duration(milliseconds: 200),

                              onQueryChanged: (value) =>
                                  updateSearchList(value),

                              borderRadius: BorderRadius.circular(25),
                              transition: CircularFloatingSearchBarTransition(),
                              actions: [
                                FloatingSearchBarAction(
                                  showIfOpened: false,
                                  child: CircularButton(
                                    icon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                FloatingSearchBarAction.searchToClear(
                                  showIfClosed: false,
                                ),
                              ],
                              builder: (context, transition) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    color: Colors.white,
                                    height: height * 100,
                                    child: ListView.separated(
                                      itemCount: searchList.length,
                                      shrinkWrap: true,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          splashColor: Colors.black12,
                                          onTap: () {
                                            Get.to(
                                              () => const ProductPage(),
                                              arguments: searchList[index],
                                            );
                                          },
                                          title: Text(
                                            searchList[index].title,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          subtitle: Text(
                                            searchList[index].category,
                                            style:
                                            const TextStyle(fontSize: 12),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            )),








                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Container(
                            height: height * 6,
                            width: height * 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: black),
                            child: PopupMenuButton(
                              icon: FaIcon(FontAwesomeIcons.sliders,
                                  color: Colors.white, size: height * 2.8),
                              itemBuilder: (context)=> [
                                PopupMenuItem(child: Text("Name"),onTap: setTitleSearch(true),),
                                PopupMenuItem(child: Text("Category"),onTap: setTitleSearch(false),),
                              ],
                            )
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
