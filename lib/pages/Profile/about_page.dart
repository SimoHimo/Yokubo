import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  List<String>aboutItems = [
    "Name:Syed Mishkatul Haque",
    "Birthday:13/3/2001",
    "Gender:male",
    "Email:xSimohimoX@gmail.com",
    "Mobile:017XXXXXXXX",
  ];
  @override
  Widget build(BuildContext context) {
    var black = const Color(0xff2c3e50);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xff2c3e50)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profilepicture.jpg"),
              radius: 50,),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                "Mishkatul Haque",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2c3e50)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: ListView.builder(
                  itemCount: aboutItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Text(
                                  aboutItems[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2c3e50)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );




    Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name:Syed Mishkatul Haque",style: TextStyle(fontSize: 25,color: black,fontWeight: FontWeight.w300),),
            Text("Birthday: 13/3/2001",style: TextStyle(fontSize: 25,color: black,fontWeight: FontWeight.w300),),
            Text("Gender:   male",style: TextStyle(fontSize: 25,color: black,fontWeight: FontWeight.w300),),
            Text("Email:      xSimohimoX@gmail.com",style: TextStyle(fontSize: 25,color: black,fontWeight: FontWeight.w300),),
            Text("Mobile:   017XXXXXXXX",style: TextStyle(fontSize: 25,color: black,fontWeight: FontWeight.w300),),
          ],
        ),
      ),
    );
  }
}
