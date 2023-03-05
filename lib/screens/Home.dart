import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/Bottomnav.dart';
import 'package:project2/widgets/appbar.dart';
import 'package:project2/widgets/drawer.dart';
import 'package:project2/models/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/widgets/homeslider.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(

      appBar: custAppbar(),

      bottomNavigationBar:custBottombar(),

      endDrawer: custDrawer(),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            // HELLO USER WELCOME TEXT

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [


                  Text("Hi,$user",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Color(0xff969696),),),

                  SizedBox(height: 10,),

                  Text("Discover Latest Books",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      ),)


                ],
              ),
            ),

            SizedBox(height: 10,),

            //TABS (NEW AND TRENDING)

            Container(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black,width: 3),),
                    unselectedLabelColor: Color(0xff969696),
                    tabs:
                    [
                      Tab(text: "New",),
                      Tab(text: "Trending",),
                    ] ),
              ),
            ),

            SizedBox(height: 10,),

            //TAB BAR VIEW (TAB AREAS)
            Container(
              width: double.maxFinite,
              height: 200,
              child: TabBarView(
                  controller: _tabController,
                  children:
              [
                homeslidernew(),
                Text("Trending"),
              ]
              ),
            ),





          ],
        ),

      ),

    );
  }

}



