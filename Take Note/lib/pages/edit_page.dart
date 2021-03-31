// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_note/pages/home_page.dart';

class EditNote extends StatefulWidget {
  final Map data;

  final DocumentReference ref;
  EditNote(this.data, this.ref);
  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String title;
  String des;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8),
          height: height * .01,
          width: width * .01,
          decoration: BoxDecoration(
            color: Color(0xff585858),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (contex) => HomePage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: edit,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              height: height * .01,
              width: width * .2,
              decoration: BoxDecoration(
                color: Color(0xff585858),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Save",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: height * .022,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            children: [
              Container(
                child: Row(),
              ),
              Form(
                child: Column(
                  children: [
                    //TITLE
                    TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "${widget.data['title']}",
                        hintStyle: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: height * .030,
                            fontWeight: FontWeight.w500),
                      ),
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: height * .030,
                          height: 1.4,
                          fontWeight: FontWeight.w500),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    SizedBox(
                      height: height * .024,
                    ),
                    //NOTE
                    TextFormField(
                      maxLines: 20,
                      decoration: InputDecoration.collapsed(
                        hintText: "${widget.data['des']}",
                        hintStyle: GoogleFonts.lato(
                            color: Colors.white.withOpacity(.9),
                            fontSize: height * .022,
                            fontWeight: FontWeight.w400),
                      ),
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: height * .022,
                          fontWeight: FontWeight.w400),
                      onChanged: (value) {
                        des = value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void edit() async {
    widget.ref.update({
      'title': title,
      'des': des,
    });
    Navigator.pop(
      context,
    );
  }

  // void add() {
  //   FirebaseFirestore.instance.collection("User").add({
  //     'title': title,
  //     'des': des,
  //     'created': DateTime.now(),
  //   }).then((value) {
  //     print(value);
  //   }).catchError((error) {
  //     print(error);
  //   });
  //   Navigator.pop(context);
  // }
}
