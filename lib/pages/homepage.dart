import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var darkwhite = const Color(0xfff6f4f3);
    var black = const Color(0xff2c3e50);
    var height = (MediaQuery.of(context).size.height) / 100;
    var width = (MediaQuery.of(context).size.width) / 100;
    List images=[
      1,2,3,4,5,6,7,8,9,0
    ];

    return
      Scaffold(
        body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              //Catagory,Profile
              Container(

                height: height * 12,
                width: width * 90,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        bottom: height,
                        child: Container(
                          height: height*4.8,
                          width: height*4.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: black
                          ),
                          child: Center(child: FaIcon(FontAwesomeIcons.bars,size: height*2.5,color: Colors.white,),),
                        )
                    ),
                    Positioned(
                        right: 0,
                        bottom: height,

                        child: Container(
                          height: height*5,
                          width: height*5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: black
                          ),
                          child: Center(child: FaIcon(FontAwesomeIcons.userAstronaut,size: height*2.8,color: Colors.white,),),
                        )
                    ),
                  ],
                ),
              ),//Catagory,Profile




              //Top Half
              //Scrolling starts here
              SizedBox(
                height: height * 88,
                width: width * 100,
                //padding: EdgeInsets.fromLTRB(0, height * 3, 0, height * 3),
                //color: Colors.redAccent,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      //Wellcome Text
                      Container(
                        height: height*15,
                        width: width*90,
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(0, height * 3, 0, height * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("YOKUBO",style:GoogleFonts.poppins(textStyle:TextStyle(fontSize:height*3.8,fontWeight: FontWeight.w800,color: black),)),
                            Text("Get What You Desire",style:GoogleFonts.poppins(textStyle:TextStyle(fontSize:height*2.8,fontWeight: FontWeight.bold,color: Colors.black45),))
                          ],
                        )
                      ),

                      //Search
                      Container(
                          height: height*10,
                          width: width*100,
                          //color: Colors.yellow,
                          padding: EdgeInsets.fromLTRB(width*5, height * 0, width * 5, height * 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height*6,
                                width: width*75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: darkwhite
                                ),
                              ),

                              Container(
                                height: height*6,
                                width: height*6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: black
                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.sliders, color: Colors.white,size: height*2.8)),
                              )

                            ],
                          )
                      ),


                      //Carousel Slider
                      Container(
                        height: height*23,
                        width: width*100,

                        padding: EdgeInsets.fromLTRB(width*5, height*1, 0, height*1),
                        //color: Colors.green,
                        child: CarouselSlider.builder(itemCount: images.length, itemBuilder:(context, index, realIndex) {
                          final number  = images[index];
                          return Container(
                            width: width*70,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(child: Text(images[index].toString())),
                          );
                        }, options: CarouselOptions(autoPlay: true,
                          padEnds: false,



                        )),
                      ),

                      //New Arrival
                      Container(
                        height: height*5,
                        width: width*90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("New Arivals",style:GoogleFonts.poppins(textStyle:TextStyle(fontSize:20,fontWeight: FontWeight.w700,color: black),)),
                            Text("View All",style:GoogleFonts.poppins(textStyle:TextStyle(fontSize:14,fontWeight: FontWeight.w600,color: black),)),

                          ],
                        ),
                      ),//New Arrival

                      //Grid
                      SizedBox(
                        height: height*140,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: width*5),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: images.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: width*3,
                              mainAxisSpacing: width*3,
                              childAspectRatio: 0.75
                          ), itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                              color: Colors.blue,
                            ),

                            child: Center(child: Text("index: $index")),
                          );
                        },),//Gridview
                      ) //Bottom

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
