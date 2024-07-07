import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Note extends StatefulWidget {
  final String title;
  final String note;

  const Note({super.key, required this.title, required  this.note});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.sizeOf(context).width/100; //divides the width of the screen in 100 parts and takes 1 part as a unit, bcoz flutter doesnt provide with a unit
    final sHeight = MediaQuery.sizeOf(context).height/100;

    return Padding(
      padding: EdgeInsets.only(bottom: sHeight*3),
      child: Container(
        height: sWidth*40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(179, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),),
        child: Padding(
          padding: EdgeInsets.all(sHeight*2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.title,
              style: GoogleFonts.raleway(
                fontSize: sHeight*2.3,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              )),
              Text(
                widget.note,
                style: GoogleFonts.raleway(
                  color: const Color.fromARGB(226, 223, 211, 200),
                  fontSize: sHeight*1.5,
                )
              )
              ],
              ),
          ),
        ),
      )

    );
  }
}