import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/note.dart';
import 'package:flutter_application_1/pages/page.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.sizeOf(context).width/100; //divides the width of the screen in 100 parts and takes 1 part as a unit, bcoz flutter doesnt provide with a unit
    final sHeight = MediaQuery.sizeOf(context).height/100;
    return Scaffold(
      body: Container(
        height: sHeight*100,
        width: sWidth*100,
        color: const Color(0xffDFD3C8),
        child: Stack(
          children: [
            Positioned(
              top: sHeight*7,
              left: sWidth*10,
              child: SizedBox(
                height: sHeight*40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: sWidth*80,
                      height: 2,
                      color: const Color(0xff464646),
                      ),
                      SizedBox(height: sHeight * 1.5),
                      Text(
                        "My Diary",
                        style: GoogleFonts.raleway(
                            color: const Color(0xff464646),
                            fontSize: sHeight * 4,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: sHeight * 1.5),
                      Container(
                        width: sWidth * 80,
                        height: 1,
                        color: const Color(0xff464646),
                      ),
                      SizedBox(height:sHeight*6),
                      GestureDetector(
                        onTap: ()
                           {
                           Navigator.push(
                            context,
                           MaterialPageRoute(
                            builder: (context)=> const NotePage(
                            title: "",
                            content: "", 
                            id: '',
                            )));
                           },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: sHeight*4,
                              child: Image.asset("assets/add.png"),
                            ),
                            Text(" new", 
                             style: GoogleFonts.raleway(
                             color: const Color(0xffDF5953),
                             fontSize: sHeight*3,
                             fontWeight:FontWeight.w600,
                            ))
                            ],
                        )
                      )
                  ]
                ),
              ),
            ),
            Positioned(
              right:0,
              top: sHeight*4,
              child: SizedBox(
                height: sHeight*40,
                child: Image.asset("assets/img3.png"),),
            ),
            Positioned(
              bottom: 0,
              left: sWidth*10,
              child: Container(
                width: sWidth*80,
                height: sHeight*71,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey.shade700,
                        ));
                  }
                  if(snapshot.hasData){
                    return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index)=> 
                  GestureDetector(
                    child: Note(
                      title: snapshot.data!.docs[index]["title"],
                      note: snapshot.data!.docs[index]["content"],                    
                    ),
                    onTap: ()
                    {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> NotePage(
                      title: snapshot.data!.docs[index]["title"],
                      content: snapshot.data!.docs[index]["content"], 
                      id: snapshot.data!.docs[index].id,
                      )));
                    }
                  ),
                );
                  }

                  return const Center(child: Text("There's no Note yet..."));
                  } ,
                )
               ),
            ),
          ],
        ),
      )
    );
  }
}

