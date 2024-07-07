
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage ({super.key});

  @override
  Widget build(BuildContext context) {

    final sWidth = MediaQuery.sizeOf(context).width/100; //divides the width of the screen in 100 parts and takes 1 part as a unit, bcoz flutter doesnt provide with a unit
    final sHeight = MediaQuery.sizeOf(context).height/100;

    return Scaffold(
      body: Container(
        width: 100*sWidth,
        height: 100*sHeight,
        color: const Color(0xffDFD3C8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sHeight*50,child: Image.asset("assets/img1.png"),
            ),
            Padding(
             padding: EdgeInsets.symmetric(horizontal: sWidth*10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: sWidth*90,
                    height: 2,
                    color:const Color(0xff464646),
                  ),

                  SizedBox(
                    height: sHeight*4,
                  ),

                  Text( 
                    "Let's get ", 
                    style: GoogleFonts.raleway(
                      color: const Color(0xff464646),
                      fontSize: sHeight*3,
                      fontWeight:FontWeight.normal ),
                    ),

                     Text( 
                    "Started", 
                    style: GoogleFonts.raleway(
                      color: const Color(0xff464646),
                      fontSize: sHeight*6,
                      fontWeight:FontWeight.w700 ),
                    ),

                     Text( 
                    "Your own personal digital\nDiary!", 
                    style: GoogleFonts.raleway(
                      color: const Color(0xff464646),
                      fontSize: sHeight*2.5,
                      fontWeight:FontWeight.w400 ),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: sHeight*20,
                  child: Image.asset("assets/img2.png"), 
                ),
                SizedBox(
                  width: sWidth*22,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
                  },
                  child: Column(
                    children: [
                     SizedBox(
                      height: sHeight*5,
                      child:  Image.asset("assets/arrow.png"),
                     ),
                     Text("This way",style: GoogleFonts.raleway(color: const Color(0xff464646),
                     fontSize: sHeight*2,
                     fontWeight: FontWeight.w400,
                     ),
                     )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}

