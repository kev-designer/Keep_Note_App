import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_note/pages/add_note.dart';
import 'package:keep_note/pages/view_note.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("notes");
  List<Color> myColours = [
    Color(0xfffefae0),
    Color(0xffFEAB8E),
    Color(0xffFECD78),
    Color(0xffE6EF96),
    Color(0xffD091DB),
    Color(0xff6F4FF1),
    Color(0xffFFFFFF),
    Color(0xffE8EEF2),
  ];
  @override
  Widget build(BuildContext context) {
    final text =
        MediaQuery.of(context).platformBrightness == Brightness.dark ? '' : '';
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 20,
          ),

          //IF ELSE PART FOR EMPTY SCREEN

          child: Stack(
            children: [
              Container(
                child: Text(
                  "My Note $text",
                  style: GoogleFonts.lato(
                    // color: Colors.white.withOpacity(.5),
                    fontSize: height * .026,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: FutureBuilder<QuerySnapshot>(
                  future: ref.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 12,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          Random random = new Random();
                          Color bg = myColours[random.nextInt(5)];
                          Map data = snapshot.data.docs[index].data();
                          //DateTime dateTime = (data['created']).toDate();
                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(
                                MaterialPageRoute(
                                  builder: (context) => ViewNote(data,
                                      snapshot.data.docs[index].reference),
                                ),
                              )
                                  .then((value) {
                                setState(() {});
                              });
                            },
                            child: Card(
                              color: bg,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data['title']}",
                                      style: GoogleFonts.lato(
                                          color: Color(0xff1E1E1E),
                                          fontSize: height * .024,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: height * .016),
                                    Container(
                                      child: Text(
                                        "${data['des']}",
                                        style: GoogleFonts.lato(
                                            color: Color(0xff1E1E1E),
                                            fontSize: height * .022,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(2),
                      );
                    } else {
                      return Center(
                        child: Text("Loading"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff5375AB),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (contex) => AddNote(),
              ),
            )
                .then((value) {
              setState(() {});
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: height * .05,
          ),
        ),
      ),
    );
  }
}

// child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset("assets/note.svg"),
//               ],
//             ),
//             SizedBox(
//               height: height * .032,
//             ),
//             Text(
//               "Create your first note",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.lato(
//                   color: Colors.white,
//                   fontSize: height * .032,
//                   fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: height * .032,
//             ),
//             Text(
//               "To create your first note, click “+Add Note Button” in the below of your text.",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.lato(
//                   color: Colors.white.withOpacity(0.5),
//                   fontSize: height * .024,
//                   height: 1.4,
//                   fontWeight: FontWeight.w400),
//             ),
//           ],
//         ),

// appBar: AppBar(
//   // backgroundColor: Colors.transparent,
//   backgroundColor: Color(0xff5375AB),
//   elevation: 0,
//   title: Text(
//     "My Note $text",
//     textAlign: TextAlign.center,
//     style: GoogleFonts.lato(
//         // color: Colors.white.withOpacity(.5),
//         fontSize: height * .026,
//         fontWeight: FontWeight.w600),
//   ),
//   actions: [
//     // ChangeThemeButton(),
//     // Padding(
//     //   padding: const EdgeInsets.only(right: 10),
//     //   child: Container(
//     //     margin: EdgeInsets.all(8),
//     //     width: width * .11,
//     //     decoration: BoxDecoration(
//     //       color: Color(0xff585858),
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //     child: InkWell(
//     //       onTap: () {
//     //         ChangeThemeButton();
//     //       },
//     //       child: Padding(
//     //         padding: const EdgeInsets.all(6.0),
//     //         child: SvgPicture.asset(
//     //           "assets/sun.svg",
//     //           height: height * .1,
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // ),
//   ],
// ),
