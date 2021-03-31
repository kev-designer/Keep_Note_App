// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_note/pages/home_page.dart';

class ViewNote extends StatefulWidget {
  final Map data;

  final DocumentReference ref;

  ViewNote(this.data, this.ref);

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String title;
  String des;
  @override
  Widget build(BuildContext context) {
    final text =
        MediaQuery.of(context).platformBrightness == Brightness.dark ? '' : '';
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
          // InkWell(
          //   Map data = snapshot.data.docs[index].data();
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => EditNote(data,snapshot.data.docs[index].reference),
          //       ),
          //     ).then((value) {
          //               setState(() {});
          //             });
          //   },
          //   child: Container(
          //     alignment: Alignment.center,
          //     margin: EdgeInsets.all(8),
          //     height: height * .01,
          //     width: width * .1,
          //     decoration: BoxDecoration(
          //       color: Color(0xff585858),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Icon(
          //       Icons.edit,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),

          InkWell(
            onTap: delete,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              height: height * .01,
              width: width * .1,
              decoration: BoxDecoration(
                color: Color(0xff585858),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.delete,
                color: Colors.white,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TITLE
                  Text(
                    "${widget.data['title']} $text",
                    style: GoogleFonts.lato(
                        // color: Colors.white,
                        fontSize: height * .030,
                        height: 1.4,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * .024,
                  ),
                  //NOTE
                  Text(
                    "${widget.data['des']} $text",
                    style: GoogleFonts.lato(
                        // color: Colors.white,
                        fontSize: height * .022,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void delete() async {
    widget.ref.delete();
    Navigator.pop(context);
  }

  // void add() {
  //   CollectionReference ref = FirebaseFirestore.instance.collection('User');

  //   var data = {
  //     'title': title,
  //     'des': des,
  //     'created': DateTime.now(),
  //   };
  //   ref.add(data);
  //   Navigator.pop(context);
  // }

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
